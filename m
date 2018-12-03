From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] x86/svm: Improve diagnostics when
 __get_instruction_length_from_list() fails
Date: Mon, 03 Dec 2018 03:41:38 -0700
Message-ID: <5C05086202000078002021FE@prv1-mh.provo.novell.com>
References: <1543597640-28870-1-git-send-email-andrew.cooper3@citrix.com>
 <1543597640-28870-2-git-send-email-andrew.cooper3@citrix.com>
 <47bf01d035a942e18076537b24b1d813@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <47bf01d035a942e18076537b24b1d813@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: andre.przywara@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjEyLjE4IGF0IDEwOjEwLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bV0KPj4gU2VudDogMzAgTm92ZW1iZXIgMjAxOCAxNzowNwo+PiAKPj4gUkZDOiBfX2dldF9pbnN0
cnVjdGlvbl9sZW5ndGhfZnJvbV9saXN0KCkgdHJpZXMgdG8gY29wZSB3aXRoIFZNRVhJVF9JT0lP
LAo+PiBidXQKPj4gSU4vT1VUIGluc3RydWN0aW9ucyBhcmVuJ3QgaW4gdGhlIGRlY29kZSBsaXN0
IGFuZCBJIGNhbid0IHNwb3QgYW4gZW50cnkKPj4gcG9pbnQKPj4gZnJvbSB0aGUgSU9JTyBwYXRo
LiAgQW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KPiAKPiBZZXMsIG9kZC4gSU9JTyBhcmUgaGFuZGxl
ZCBpbiB0aGUgaWZkZWYgTkRFQlVHIGJsb2NrcyBidXQgYW4gSU9JTyBleGl0IGRvZXMgCj4gaW5k
ZWVkIG5vdCBjYWxsIGludG8gX19nZXRfaW5zdHJ1Y3Rpb25fbGVuZ3RoKCkgYnV0IGRvZXMgdGhl
IHNhbWUgY2FsY3VsYXRpb24gCj4gaW5saW5lLiAKCkluZGVlZCBjb21taXQgMTQ3ODA4YjhiOCBp
bnRyb2R1Y2VkIHRoaXMgd2l0aG91dCB0aGVyZSBiZWluZwphIHZpc2libGUgb3Igc3RhdGVkIHJl
YXNvbi4gQW5kcmUsIGFueSBjaGFuY2UgeW91IGNhbiByZWNvbnN0cnVjdAp0aGUgcmVhc29uIGZy
b20gYWxtb3N0IDkgeWVhcnMgYWdvPyBUaGUgX19nZXRfaW5zdHJ1Y3Rpb25fbGVuZ3RoKCkKaW52
b2NhdGlvbiB0aGUgY2hhbmdlIGFkZGVkIGlzIFZNWCBzcGVjaWZpYyAuLi4KCkphbgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
