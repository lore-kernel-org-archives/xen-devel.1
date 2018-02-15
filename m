From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 0/4] hvm/svm: Enable vm events for SVM
Date: Thu, 15 Feb 2018 12:36:42 +0000
Message-ID: <4ac41b55-8a8a-6f59-a640-9b2b9b20b2e6@citrix.com>
References: <1518690146-19972-1-git-send-email-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1518690146-19972-1-git-send-email-aisaila@bitdefender.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Isaila <aisaila@bitdefender.com>, xen-devel@lists.xen.org
Cc: boris.ostrovsky@oracle.com, tamas@tklengyel.com, jbeulich@suse.com, suravee.suthikulpanit@amd.com, rcojocaru@bitdefender.com
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDIvMTggMTA6MjIsIEFsZXhhbmRydSBJc2FpbGEgd3JvdGU6Cj4gSGkgYWxsLAo+Cj4g
VGhpcyBzZXJpZXMgcHJvdmlkZXMgYSBza2VsZXRvbiBmb3IgZW5hYmxpbmcgdm1fZXZlbnRzIG9u
IFNWTS4gRm9yIHRoZQo+IGZpcnN0IHN0ZXAsIHRoZSBNU1IsIENSLCBCcmVha3BvaW50IGFuZCBH
dWVzdFJlcXVlc3QgaGF2ZSBiZWVuIHRlc3RlZAo+IGFuZCBhZGRlZCB0byB0aGUgY2FwYWJpbGl0
aWVzIGxpc3QuCgpPayAtIHRoaXMgc2VyaWVzIGlzIGxvb2tpbmcgbXVjaCBjbGVhcmVyIG5vdy7C
oCBUaGFua3MuCgpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4gKGFsdGhvdWdoIHRoZXJlIGlzCm9uZSB0cml2aWFsIHN0eWxlIGlzc3VlIGluIHBhdGNo
IDEgSSBjYW4gZml4IG9uIGNvbW1pdCkuCgpZb3UgYXJlIHN0aWxsIHdhaXRpbmcgZm9yIFNWTSBh
Y2tzIG9uIHBhdGNoZXMgMSBhbmQgMyBieSB0aGUgbG9va3Mgb2YKdGhpbmdzLgoKT25lIHRoaW5n
IEkgbm90ZSBob3dldmVyIGlzIHRoYXQgcGF0Y2ggMiBhbmQgMyBib3RoIHR1cm4gb24gaW50ZXJj
ZXB0cwphbmQgaGF2ZSBubyB3YXkgb2YgdHVybmluZyB0aGVtIGJhY2sgb2ZmLsKgIFRoaXMgYXBw
ZWFycyB0byBiZSBjb25zaXN0ZW50CndpdGggdGhlIEludGVsIHNpZGUgb2YgdGhpbmdzLCBidXQg
aXQgaXMgc3Vib3B0aW1hbCBmb3IgdGhlIGd1ZXN0IHdoZW4KYW4gaW50cm9zcGVjdGlvbiBhZ2Vu
dCBkZXRhY2hlcy4KCkZvciB0aGUgQ1BVSUQvTVNSIHBvbGljeSBzaWRlIG9mIHRoaW5ncywgSmFu
IGhhcyB0YWxrZWQgbWUgaW4gdG8KY2hhbmdpbmcgaG93IGNwdWlkX3BvbGljeV91cGRhdGVkKCkg
d29ya3MsIGFuZCBpbXBsZW1lbnRpbmcgaXQgYXMgYQpyZWNhbGN1bGF0aW9uIG9mIHRoZSBpbnRl
cmNlcHRzIG9uIHRoZSByZXR1cm4tdG8tZ3Vlc3QgcGF0aC7CoCBJdCBvY2N1cnMKdG8gbWUgdGhh
dCB0aGlzIHVzZWZ1bGx5IGV4dGVuZHMgdG8gY2hhbmdlcyByZXF1ZXN0ZWQgYnkgdGhlCmludHJv
c3BlY3Rpb24gYWdlbnQuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
