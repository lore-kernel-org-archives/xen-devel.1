From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/5] xen/domain: Prepare data for is_{pv,
 hvm}_domain() as early as possible
Date: Mon, 03 Sep 2018 10:03:27 -0600
Message-ID: <5B8D5B4F02000078001E4C4E@prv1-mh.provo.novell.com>
References: <1535986020-15906-1-git-send-email-andrew.cooper3@citrix.com>
 <1535986020-15906-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1535986020-15906-2-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA5LjE4IGF0IDE2OjQ2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gR2l2ZW4gdHdvIHN1YnRsZSBmYWlsdXJlcyBmcm9tIGdldHRpbmcgdGhpcyB3cm9uZyBi
ZWZvcmUsIGFuZCBtb3JlIGNsZWFudXAgb24KPiB0aGUgd2F5LCBtb3ZlIHRoZSBzZXR0aW5nIG9m
IGQtPmd1ZXN0X3R5cGUgYXMgZWFybHkgYXMgcG9zc2libGUuCj4gCj4gTm90ZSB0aGF0IGRlc3Bp
dGUgbW92aW5nIHRoZSBhc3NpZ25tZW50IG9mIGQtPmd1ZXN0X3R5cGUgb3V0c2lkZSBvZiB0aGUK
PiBpc19pZGxlX2RvbWFpbihkKSBjaGVjaywgaXQgc3RpbGwgYmVoYXZlcyB0aGUgc2FtZS4gIFBy
ZXZpb3VzbHksIHN5c3RlbQo+IGRvbWFpbnMgaGFkIG5vIGRpcmVjdCBhc3NpZ25tZW50IG9mIGQt
Pmd1ZXN0X3R5cGUgYW5kIGJlaGF2ZWQgYXMgUFYgZ3Vlc3RzCj4gYmVjYXVzZSBndWVzdF90eXBl
X3B2IGhhcyB0aGUgdmFsdWUgMC4KPiAKPiBXaGlsZSB0aWR5aW5nIHVwIHRoZSBwcmVkaWNhdGUs
IGxlYXZlIGEgY29tbWVudCByZWZlcmluZyB0bwo+IGlzX3N5c3RlbV9kb21haW4oKSwgYW5kIG1v
dmUgdGhlIGFzc29jaWF0ZWQgQVNTRVJUKCkgdG8gYmUgYmVzaWRlIHRoZQo+IGFzaWdubWVudC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCj4gLS0tIGEv
eGVuL2NvbW1vbi9kb21haW4uYwo+ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMKPiBAQCAtMjcy
LDggKzI3MiwxMiBAQCBzdHJ1Y3QgZG9tYWluICpkb21haW5fY3JlYXRlKGRvbWlkX3QgZG9taWQs
Cj4gICAgICBpZiAoIChkID0gYWxsb2NfZG9tYWluX3N0cnVjdCgpKSA9PSBOVUxMICkKPiAgICAg
ICAgICByZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKPiAgCj4gKyAgICAvKiBTb3J0IG91dCBvdXIg
aWRlYSBvZiBpc19zeXN0ZW1fZG9tYWluKCkuICovCj4gICAgICBkLT5kb21haW5faWQgPSBkb21p
ZDsKPiAgCj4gKyAgICAvKiBEZWJ1ZyBzYW5pdHkuICovCj4gKyAgICBBU1NFUlQoaXNfc3lzdGVt
X2RvbWFpbihkKSA/IGNvbmZpZyA9PSBOVUxMIDogY29uZmlnICE9IE5VTEwpOwoKV291bGQgeW91
IG1pbmQgc2hvcnRlbmluZyB0aGlzIHRvIGF0IGxlYXN0CgogICAgQVNTRVJUKGlzX3N5c3RlbV9k
b21haW4oZCkgPyAhY29uZmlnIDogY29uZmlnKTsKCndoaWxlIHlvdSBtb3ZlIGl0PwoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
