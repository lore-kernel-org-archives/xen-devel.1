From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v11 1/9] xen: use __UINTPTR_TYPE__ for
 uintptr_t
Date: Fri, 8 Mar 2019 14:18:22 +0000
Message-ID: <f13e5405-e5e4-81b8-c777-0a6dfb02fe88@citrix.com>
References: <alpine.DEB.2.10.1903051433230.17552@sstabellini-ThinkPad-X260>
 <1551825512-8975-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NONk=RL=citrix.com=prvs=9636e147a=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h2GL4-0001BP-7V
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2019 14:19:06 +0000
In-Reply-To: <1551825512-8975-1-git-send-email-sstabellini@kernel.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefanos@xilinx.com>, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, tim@xen.org, ian.jackson@eu.citrix.com, George.Dunlap@citrix.com, julien.grall@arm.com, JBeulich@suse.com, ian.jackson@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDMvMjAxOSAyMjozOCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IFVzZSBfX1VJ
TlRQVFJfVFlQRV9fIHRvIGRlZmluZSB1aW50cHRyX3QuIEEgbGF0ZXIgcGF0Y2ggd2lsbCBtYWtl
IHVzZSBvZgo+IF9fUFRSRElGRl9UWVBFX18gdG8gZGVmaW5lIHB0cmRpZmZfdC4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KPiBSZXZp
ZXdlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQ0M6IGpi
ZXVsaWNoQHN1c2UuY29tCj4gQ0M6IGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20KPiBDQzoganVs
aWVuLmdyYWxsQGFybS5jb20KPiBDQzogR2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tCj4gQ0M6
IGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20KPiBDQzoga29ucmFkLndpbGtAb3JhY2xlLmNvbQo+
IENDOiB0aW1AeGVuLm9yZwo+IENDOiB3ZWkubGl1MkBjaXRyaXguY29tCj4gLS0tCj4gQ2hhbmdl
cyBpbiB2MTE6Cj4gLSBzcGxpdCBwYXRjaAo+IC0tLQo+ICB4ZW4vaW5jbHVkZS94ZW4vdHlwZXMu
aCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3R5cGVzLmggYi94ZW4vaW5jbHVkZS94
ZW4vdHlwZXMuaAo+IGluZGV4IDAzZjBmZTYuLjEwNTlmYWIgMTAwNjQ0Cj4gLS0tIGEveGVuL2lu
Y2x1ZGUveGVuL3R5cGVzLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vdHlwZXMuaAo+IEBAIC01
Miw3ICs1Miw3IEBAIHR5cGVkZWYgX191MzIgX19iZTMyOwo+ICB0eXBlZGVmIF9fdTY0IF9fbGU2
NDsKPiAgdHlwZWRlZiBfX3U2NCBfX2JlNjQ7Cj4gIAo+IC10eXBlZGVmIHVuc2lnbmVkIGludCBf
X2F0dHJpYnV0ZV9fKChfX21vZGVfXyhfX3BvaW50ZXJfXykpKSB1aW50cHRyX3Q7Cj4gK3R5cGVk
ZWYgX19VSU5UUFRSX1RZUEVfXyB1aW50cHRyX3Q7CgpJJ3ZlIGFscmVhZHkgcmFpc2VkIGFuIG9i
amVjdGVkIHRvIHRoaXMgb25jZSwgc28gSSdtIGdvaW5nIHRvIGJlIHZlcnkKYmx1bnQgYW5kIGNy
eXN0YWwgY2xlYXIuCgpOQUNLLgoKU3RvcCBtZXNzaW5nIGFyb3VuZCB3aXRoIEdDQy1pc21zIGFu
ZCB1c2UgdGhlIHNwZWMtY29tcGxpYW50IHdheSBvZgpnZXR0aW5nIHVpbnRwdHJfdCAoYW5kIG90
aGVycykuCgojaW5jbHVkZSA8c3RkaW50Lmg+CgpUaGF0IHdheSwgKmFueSogY29tcGlsZXIgd2ls
bCBnaXZlIHlvdSBhIHdvcmtpbmcgdWludHB0cl90LCBub3QganVzdAp0aG9zZSB3aGljaCBhcmUg
ZW11bGF0aW5nIEdDQydzIGludGVybmFscy4KClRoaXMgaXNuJ3Qgcm9ja2V0IHNjaWVuY2UsIGFu
ZCBJIGtub3cgYWxsIG9mIHVzIGhhdmUgYmV0dGVyIHRoaW5ncyB0byBiZQpkb2luZyB0aGF0IHdh
c3RpbmcgdGltZSBhcmd1aW5nIG92ZXIgYXNwZWN0cyB3aGljaCBhcmUgdW5yZWxhdGVkIHRvCmFj
dHVhbGx5IGZpeGluZyB0aGUgcHJvYmxlbS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
