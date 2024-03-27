//
//  LoremSwiftifyStruct.swift
//
//
//  Created by Enes Karaosman on 25.03.2024.
//

import SwiftCompilerPlugin
import SwiftDiagnostics
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

class LoremSwiftifyClass {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: ClassDeclSyntax,
        in context: some MacroExpansionContext,
        type: some SwiftSyntax.TypeSyntaxProtocol
    ) throws -> DeclSyntax {
        if declaration.memberBlock.members.isEmpty {
            context.diagnose(.init(node: declaration, message: LoremSwiftifyMacroDiagnostic.noMemberToMock))
        }

        return try LoremSwiftifyMacroParsingShared.handleClassOrStructDeclSyntax(
            selfName: "\(type)",
            members: declaration.memberBlock.members,
            in: context,
            isClass: true
        )
    }
}
