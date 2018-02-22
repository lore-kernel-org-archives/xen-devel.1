From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] build: Rename as-insn-check to as-insn-add
Date: Thu, 22 Feb 2018 11:41:18 +0000
Message-ID: <3ce4604a-1f4c-1ee3-cff1-884fd2c1226c@citrix.com>
References: <1519296673-19470-1-git-send-email-andrew.cooper3@citrix.com>
 <5A8EB8A402000078001AA56C@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A8EB8A402000078001AA56C@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDIvMTggMTE6MzMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIyLjAyLjE4IGF0
IDExOjUxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IGFzLWluc24tY2hl
Y2sgbXV0YXRlcyB0aGUgcGFzc2VkLWluIGZsYWdzLiAgUmVuYW1lIGl0IHRvIGFzLWluc24tYWRk
LCBpbiBsaW5lCj4+IHdpdGggY2Mtb3B0aW9uLWFkZC4gIFVwZGF0ZSBhbGwgY2FsbGVycy4KPiBJ
J20gbm90IGNvbnZpbmNlZCAtIGNjLW9wdGlvbi1hZGQgbWFrZXMgcmVsYXRpdmVseSBjbGVhciB0
aGF0Cj4gc29tZXRoaW5nIGlzIGJlaW5nIGFkZGVkIHRvIHRoZSBvcHRpb25zIHBhc3NlZCB0byBD
Qy4gSWYgSQo+IHRha2UgYXMtaW5zbi1hZGQgdGhpcyB3YXksIHRoZSBtYWNybyB3b3VsZCBuZWVk
IHRvIGFkZCBhbgo+IGluc24gdG8gdGhlIEFTIGludm9jYXRpb24uIFdoaWxlIEkgYWdyZWUgYXMt
aW5zbi1jaGVjayBkb2Vzbid0Cj4gbWFrZSBjbGVhciB0aGF0IGl0IGFkZHMgYW55IG9wdGlvbnMs
IEkgc3RpbGwgZmluZCB0aGlzIGxlc3MKPiBtaXNsZWFkaW5nIHRoYW4gdGhlIHN1Z2dlc3RlZCBu
ZXcgbmFtZS4gTGV0J3Mgc2VlIHdoYXQKPiBvdGhlcnMgdGhpbmsuCgpJJ20gb3BlbiB0byBiZXR0
ZXIgbmFtZSBzdWdnZXN0aW9ucy7CoCBjYy1vcHRpb24tYWRkIGFuZCBhcy1pbnNuLWNoZWNrCmFy
ZSBiYXNpY2FsbHkgdGhlIHNhbWU7IHRoZXkgbWFrZSBhIHRlc3QgYmFzZWQgb24gYSBwcm9wb3Nl
ZCBjb25zdHJ1Y3QsCmFuZCBlbmQgdXAgbXV0YXRpbmcgRkxBR1MuCgpUaGUgcmVhc29uIEkgbm90
aWNlZCBpcyBiZWNhdXNlIFJvZ2VycyBwYXRjaCBhZGRzIGFuIG9wdGlvbi1ubyBjYXNlIHRvCmFz
LWluc24tY2hlY2suCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
