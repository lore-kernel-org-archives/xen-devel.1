From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 2/3] x86/HVM: add known_gla() emulation
 helper
Date: Thu, 06 Sep 2018 07:22:26 -0600
Message-ID: <5B912A1202000078001E5F66@prv1-mh.provo.novell.com>
References: <5B87CF6302000078001E37A6@prv1-mh.provo.novell.com>
 <5B91249102000078001E5F08@prv1-mh.provo.novell.com>
 <5B9125B502000078001E5F1A@prv1-mh.provo.novell.com>
 <f94af765a03b45cfa562662284362a91@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=pp8w=lu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fxuEx-0000H1-41
 for xen-devel@lists.xenproject.org; Thu, 06 Sep 2018 13:22:31 +0000
In-Reply-To: <f94af765a03b45cfa562662284362a91@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Olaf Hering <olaf@aepfle.de>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA2LjA5LjE4IGF0IDE1OjEyLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSmFuIEJldWxpY2ggW21h
aWx0bzpKQmV1bGljaEBzdXNlLmNvbV0KPj4gU2VudDogMDYgU2VwdGVtYmVyIDIwMTggMTQ6MDQK
Pj4gVG86IHhlbi1kZXZlbCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnPgo+PiBDYzog
T2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPjsgQW5kcmV3IENvb3Blcgo+PiA8QW5kcmV3LkNv
b3BlcjNAY2l0cml4LmNvbT47IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+
Cj4+IFN1YmplY3Q6IFtQQVRDSCB2MyAyLzNdIHg4Ni9IVk06IGFkZCBrbm93bl9nbGEoKSBlbXVs
YXRpb24gaGVscGVyCj4+IAo+PiAuLi4gYXMgYSBjZW50cmFsIHBsYWNlIHRvIGRvIHJlc3BlY3Rp
dmUgY2hlY2tpbmcgZm9yIHdoZXRoZXIgdGhlCj4+IHRyYW5zbGF0aW9uIGZvciB0aGUgbGluZWFy
IGFkZHJlc3MgaXMgYXZhaWxhYmxlIGFzIHdlbGwgYXMgdXNhYmxlLgo+PiAKPj4gU2lnbmVkLW9m
Zi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiAtLS0KPj4gdjM6IFNwbGl0
IGZyb20gc3Vic2VxdWVudCBwYXRjaC4KPiAKPiBNdWNoIG5pY2VyIDotKQo+IAo+IFJldmlld2Vk
LWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKVGhhbmtzOyBhbnkg
Y2hhbmNlIG9mIGFsc28gZ2V0dGluZyBhbiBhY2sgZm9yIHBhdGNoIDE/CgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
