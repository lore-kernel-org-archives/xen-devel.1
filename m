From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: Xen 4.12.0-rc Hangs Around masked ExtINT on CPU#
Date: Mon, 27 May 2019 18:18:32 +0200
Message-ID: <20190527161832.arry25rh4chyxkio@Air-de-Roger>
References: <9288a3b8-8c59-c80f-68f3-14aaca9272d4@gmail.com>
 <5C99DD160200007800221D00@prv1-mh.provo.novell.com>
 <25b66cdf-94ad-6af1-de5f-e0f5369ae000@gmail.com>
 <5C9B30D002000078002220F5@prv1-mh.provo.novell.com>
 <1fccf915-9d0b-52ac-4d6d-df16194dabb0@gmail.com>
 <5C9B86FA0200007800222232@prv1-mh.provo.novell.com>
 <daff9af3-5008-42ac-1355-ca8ef94fadb5@gmail.com>
 <20190429120238.b4kjlmkpk5l2t6yb@Air-de-Roger>
 <f4f4007c-4643-aecf-6ab7-811c00156fca@gmail.com>
 <20190429152734.qy34zz56e43pawvf@Air-de-Roger>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20190429152734.qy34zz56e43pawvf@Air-de-Roger>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: "John L. Poole" <jlpoole56@gmail.com>, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMDU6Mjc6MzRQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBJTU8gaXQgd291bGQgYmUgYmV0dGVyIGlmIHlvdSBjYW4gYnVpbGQgZGlyZWN0
bHkgZnJvbSB0aGUgdXBzdHJlYW0gZ2l0Cj4gcmVwb3NpdG9yeSBbMF0sIHRoYXQgd2F5IHlvdSBj
b3VsZCB1c2UgZ2l0LWJpc2VjdCgxKSBpbiBvcmRlciB0byBmaWd1cmUKPiBvdXQgd2hpY2ggY29t
bWl0IGJyb2tlIHlvdXIgc3lzdGVtLiBGb3IgZXhhbXBsZToKPiAKPiAjIGdpdCBjbG9uZSBnaXQ6
Ly94ZW5iaXRzLnhlbi5vcmcveGVuLmdpdAo+ICMgY2QgeGVuCj4gIyBnaXQgY2hlY2tvdXQgUkVM
RUFTRS00LjcuMAo+ICMgbWFrZSB4ZW4gLWo4Cj4gCj4gVGhhdCBzaG91bGQgZ2l2ZSB5b3UgYSBz
ZXQgb2YgWGVuIGJpbmFyaWVzIGluIHRoZSB4ZW4vIGRpcmVjdG9yeSwgSUlSQwo+IHlvdSBhcmUg
Ym9vdGluZyBmcm9tIEVGSSBzbyB5b3UgbGlrZWx5IG5lZWQgeGVuL3hlbi5lZmkuCj4gCj4gSWYg
dGhhdCB3b3JrcywgdGhlbiB5b3UgY2FuIHRlc3QgUkVMRUFTRS00LjguMCBhbmQgaWYgdGhhdCBm
YWlscyB0bwo+IGJvb3QgeW91IHNob3VsZCBoYXZlIGEgcmFuZ2Ugb2YgY29tbWl0cyB0aGF0IHlv
dSBjYW4gYmlzZWN0IGluIG9yZGVyCj4gdG8gZmluZCB0aGUgY3VscHJpdC4KCkZXSVcsIEkndmUg
YmVlbiB1bmFibGUgdG8gZmluZCBhIGJveCB3aXRoIHRoZSBzYW1lIENQVSBtb2RlbCAoQzI3NTAp
CnRoYXQgeW91IGFyZSB1c2luZy4gSSd2ZSBmb3VuZCBhIGNvdXBsZSBvZiBvbGQgQXRvbSBib3hl
cyB1c2luZwpkaWZmZXJlbnQgQ1BVcyBidXQgdGhleSBhbGwgc2VlbSB0byBib290IGZpbmUgdXNp
bmcgbGF0ZXN0Cnhlbi11bnN0YWJsZS4gSSd2ZSBsb29rZWQgb24gZUJheSBmb3IgdGhhdCBDUFUg
YnV0IGV2ZXJ5dGhpbmcKY29udGFpbmluZyBpdCBpcyBzZXJ2ZXItZ3JhZGUgYW5kID4yMDAkIHdo
aWNoIEknbSBzYWRseSBub3QgZ29pbmcgdG8KcGF5LgoKVW5sZXNzIHlvdSBhcmUgYWJsZSB0byBi
aXNlY3QgdGhlIHRyZWUgYW5kIGdpdmUgdXMgdGhlIGJhZCBjb21taXQKdGhhdCdzIGNhdXNpbmcg
eW91ciBpc3N1ZXMgSSdtIGFmcmFpZCBhdCBsZWFzdCBteXNlbGYgSSB3b24ndCBiZSBhYmxlCnRv
IHByb2dyZXNzIHRoaXMgYW55IGZ1cnRoZXIsIHNvcnJ5LgoKUm9nZXIuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
