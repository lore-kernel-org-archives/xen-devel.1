From: Lars Kurth <lars.kurth@citrix.com>
Subject: [PATCH for-4.11 v2 0/2] Add Designated Reviewer (R:) to
 MAINTAINERS (plus a test case)
Date: Fri, 27 Apr 2018 19:01:01 +0100
Message-ID: <cover.1524851673.git.lars.kurth@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ezub=hq=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1fC7gh-0004PO-LQ
 for xen-devel@lists.xenproject.org; Fri, 27 Apr 2018 18:01:39 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBmb2xsb3dzIHVwIGZyb20gYSBjb252ZXJzYXRpb24gYWZ0ZXIgdGhlIEFwcmlsIHg4NiBj
b21tdW5pdHkgY2FsbCwgaW4gd2hpY2ggSSBoYWQKdGhlIGZvbGxvd2luZyBhY3Rpb246IExhcnMg
dG8gcHJvcG9zZSBmaXhpbmcgQ0MgaXNzdWUgaW4geGVuLmdpdDpNQUlOVEFJTkVSUyBjb3B5aW5n
IAp0aGUgUiBzZWN0aW9uIGVudHJpZXMgZnJvbSBMaW51eC5naXQ6TUFJTlRBSU5FUlMgKHdpbGwg
bmVlZCBjaGFuZ2VzIHRvIApnZXRfbWFpbnRhaW5lcnMucGwgYWxzbykKCk9uIDI3LzQvMTggSnVl
cmdlbiBnYXZlIGEgUkFCIHZpYSBJUkMKCkNjOiBMYXJzIEt1cnRoIDxsYXJzLmt1cnRoQGNpdHJp
eC5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzog
R2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSWFuIEphY2tz
b24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CkNjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDYzogS29u
cmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogVGltIERlZWdhbiA8dGltQHhl
bi5vcmc+CkNjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpDYzogQnJpYW4gV29vZHMg
PGJyaWFuLndvb2RzQGFtZC5jb20+CkNjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkFja2Vk
LWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKTGFycyBLdXJ0aCAoMik6CiAgQWRk
IEJyaWFuIFdvb2RzIGFzIERlc2lnbmF0ZWQgcmV2aWV3ZXIgdG8gQU1EIElPTU1VIGFuZCBBTUQg
U1ZNCiAgQWRkIERlc2lnbmF0ZWQgUmV2aWV3ZXIgKFI6KSB0byBNQUlOVEFJTkVSUyBmaWxlIGFu
ZCBhZGQgc3VwcG9ydCBmb3IKICAgIGl0IGluIGdldF9tYWludGFpbmVyLnBsCgogTUFJTlRBSU5F
UlMgICAgICAgICAgICAgICB8ICA0ICsrKysKIHNjcmlwdHMvZ2V0X21haW50YWluZXIucGwgfCAy
NCArKysrKysrKysrKy0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9u
cygrKSwgMTMgZGVsZXRpb25zKC0pCgotLSAKMi4xMy4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
