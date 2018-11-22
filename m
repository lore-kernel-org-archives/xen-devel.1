From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 05/14] x86/p2m: Don't overwrite
 p2m_altp2m_lazy_copy()'s callers p2m pointer
Date: Thu, 22 Nov 2018 08:03:39 -0700
Message-ID: <5BF6C54B02000078001FEFCD@prv1-mh.provo.novell.com>
References: <1542806482-24030-1-git-send-email-andrew.cooper3@citrix.com>
 <1542806482-24030-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542806482-24030-6-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjExLjE4IGF0IDE0OjIxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlIGZpbmFsIHBhcmFtZXRlciB0byBwMm1fYWx0cDJtX2xhenlfY29weSgpIGFwcGVh
cnMgdG8gYmUgdW5uZWNlc3NhcnksIGFuZAo+IHJlc3VsdHMgaW4gdmVyeSBoYXJkLXRvLWZvbGxv
dyBjb2RlLiAgSGF2ZSB0aGUgc29sZSBjYWxsZXIgc2V0IGl0cyBsb2NhbCBwMm0KPiBwb2ludGVy
IGFwcHJvcHJpYXRlbHksIGFuZCBkcm9wIHRoZSBwYXJhbWV0ZXIuCj4gCj4gV2l0aCB0aGF0IGRv
bmUsIGEgbGV2ZWwgb2YgaW5kaXJlY3Rpb24gb2YgYXAybSBjYW4gYmUgZHJvcHBlZCBpbnNpZGUK
PiBwMm1fYWx0cDJtX2xhenlfY29weSgpLiAgV2hpbGUgY2hhbmdpbmcgdGhlIEFQSSwgc3dpdGNo
IGl0IGZyb20gYm9vbF90IHRvCj4gYm9vbCwgYW5kIGRyb3AgcHJpbnRpbmcgb2YgdGhlIGFsdHAy
bSdzIHZpcnR1YWwgYWRkcmVzcywgYmVjYXVzZSBpdCBpcyBvZiBubwo+IHVzZSBldmVuIHdoZW4g
ZGVidWdnaW5nLgo+IAo+IE5vIChpbnRlbmRlZCkgb3ZlcmFsbCBjaGFuZ2UgaW4gYmVoYXZpb3Vy
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
