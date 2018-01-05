From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v17 06/11] x86/hvm/ioreq: add a new mappable
 resource type...
Date: Fri, 05 Jan 2018 03:29:27 -0700
Message-ID: <5A4F6197020000780019B4E2@prv-mh.provo.novell.com>
References: <20180103121942.3524-1-paul.durrant@citrix.com>
 <20180103121942.3524-7-paul.durrant@citrix.com>
 <5A4D094A020000780019A91D@prv-mh.provo.novell.com>
 <d73af670c6044eb5ac76b497e68e139b@AMSPEX02CL03.citrite.net>
 <5A4D15AA020000780019A982@prv-mh.provo.novell.com>
 <deb8dc1bc8b04b84bbbe1522c4b75125@AMSPEX02CL03.citrite.net>
 <189cf1e39a0a498eb4fca9effadddf06@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ivak=ea=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eXPFm-0007qd-TI
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2018 10:29:34 +0000
In-Reply-To: <189cf1e39a0a498eb4fca9effadddf06@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, JulienGrall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAxLjE4IGF0IDExOjE2LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5w
cm9qZWN0Lm9yZ10gT24gQmVoYWxmCj4+IE9mIFBhdWwgRHVycmFudAo+PiBTZW50OiAwMyBKYW51
YXJ5IDIwMTggMTY6NDgKPj4gT2ssIHRoYW5rcy4gSWYgY2hhbmdlIGJhY2sgdG8gaGF2aW5nIHRo
ZSBwYWdlcyBvd25lZCBieSB0aGUgdG9vbHMgZG9tYWluCj4+IHRoZW4gSSBndWVzcyB0aGlzIHdp
bGwgYWxsIGJlIGF2b2lkZWQgYW55d2F5Lgo+IAo+IEkndmUgcnVuIGludG8gYSBwcm9ibGVtIHRo
aXMgdGhpcywgYnV0IGl0IG1heSBiZSBlYXNpbHkgc29sdWFibGUuLi4KPiAKPiBJZiBJIHBhc3Mg
YmFjayB0aGUgZG9taWQgb2YgdGhlIHJlc291cmNlIHBhZ2Ugb3duZXIgYW5kIHRoYXQgb3duZXIg
aXMgdGhlIAo+IHRvb2xzIGRvbWFpbiwgdGhlbiB3aGVuIHRoZSB0b29scyBkb21haW4gYXR0ZW1w
dHMgdGhlIG1tdV91cGRhdGUgaHlwZXJjYWxsIGl0IAo+IGZhaWxzIGJlY2F1c2UgaXQgaGFzIHBh
c3NlZCBpdHMgb3duIGRvbWlkIHRvIG1tdV91cGRhdGUuIFRoZSBmYWlsdXJlIGlzIAo+IGNhdXNl
ZCBieSBhIGNoZWNrIGluIGdldF9wZ19vd25lcigpIHdoaWNoIGVycm9ycyBvd24gaWYgdGhlIHBh
c3NlZCBpbiBkb21pZCAKPiA9PSBjdXJyLT5kb21haW5faWQgYnV0LCBzdHJhbmdlbHksIG5vdCBp
ZiBkb21pZCA9PSBET01JRF9TRUxGLiBBbnkgaWRlYSB3aHkgCj4gdGhpcyBjaGVjayBpcyB0aGVy
ZT8gVG8gbWUgaXQgbG9va3MgbGlrZSBpdCBzaG91bGQgYmUgc2FmZSB0byBzcGVjaWZ5IAo+IGN1
cnItPmRvbWFpbl9pZCBhbmQgaGF2ZSBnZXRfcGdfb3duZXIoKSBzaW1wbHkgYmVoYXZlIGFzIGlm
IERPTUlEX1NFTEYgd2FzIAo+IHBhc3NlZC4KCkEgbGl0dGxlIHdoaWxlIHRoZXJlIHdhcyBzb21l
IGRpc2N1c3Npb24gb24gdGhpcyBnZW5lcmFsIHRvcGljIChzYWRseQpJIGRvbid0IHJlY2FsbCB0
aGUgY29udGV4dCksIGFuZCBpaXJjIGl0IHdhcyBpbiBwYXJ0aWN1bGFyIEFuZHJldyAob3IKR2Vv
cmdlPykgd2hvIHRob3VnaHQgaXQgc2hvdWxkIGJlIHRoZSBvdGhlciB3YXkgYXJvdW5kOiBJZgpE
T01JRF9TRUxGIGNhbiBiZSB1c2VkLCB0aGUgYWN0dWFsIGRvbWFpbiBJRCBzaG91bGQgbm90IGJl
CmFjY2VwdGVkICh3aGljaCBpaXJjIGlzIGN1cnJlbnRseSB0aGUgY2FzZSBpbiBzb21lIHBsYWNl
cywgYnV0IG5vdAppbiBvdGhlcnMpLiBCdXQgLi4uCgo+IFRoZSBhbHRlcm5hdGl2ZSB3b3VsZCBi
ZSB0byBoYXZlIHRoZSBhY3F1aXJlX3Jlc291cmNlIGh5cGVyY2FsbCBkbyB0aGUgY2hlY2sgCj4g
YW5kIHBhc3MgYmFjayBET01JRF9TRUxGIGlzIHRoZSBpb3JlcSBzZXJ2ZXIgZG0gZG9tYWluIGhh
cHBlbnMgdG8gbWF0Y2ggCj4gY3VycmQtPmRvbWFpbl9pZCwgYnV0IHRoYXQgc2VlbXMgYSBiaXQg
aWNreS4KCi4uLiB0aGlzIHdhc24ndCB0aGUgcGxhbiBhbnl3YXkuIEluc3RlYWQgd2UgaGFkIHRh
bGtlZCBvZiB0aGUKaHlwZXJjYWxsIHJldHVybmluZyBqdXN0IGEgYm9vbGVhbiBpbmRpY2F0b3Is
IHRvIGRpc3Rpbmd1aXNoCnNlbGYtb3duZWQgcGFnZXMgZnJvbSB0YXJnZXQtZG9tYWluLW93bmVk
IG9uZXMuIFRoZQpjYWxsZXIgaXMgc3VwcG9zZWQgdG8ga25vdyB0aGUgZG9tYWluIElEIG9mIHRo
ZSB0YXJnZXQgZG9tYWluLAphZnRlciBhbGwuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
