From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for 4.9 and older] x86: don't enable XPTI on
 idle domain
Date: Wed, 30 May 2018 11:04:08 +0100
Message-ID: <32677965-a37a-b2c1-5635-f3a4877c57eb@citrix.com>
References: <5B0E66EC02000078001C6E0D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/ns+=ir=citrix.com=prvs=681023c44=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fNxxk-0003bs-GM
 for xen-devel@lists.xenproject.org; Wed, 30 May 2018 10:04:12 +0000
In-Reply-To: <5B0E66EC02000078001C6E0D@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDUvMTggMDk6NTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFdoaWxlIHRoZSBpbnZvbHZl
ZCBjb2RlIChpbiBwdl9kb21haW5faW5pdGlhbGlzZSgpKSBzaXRzIGJlaGluZCBhbgo+ICFpc19p
ZGxlX2RvbWFpbigpIGNoZWNrIGFscmVhZHksIHdlIG5lZWQgdG8gYWRkIG9uZSBoZXJlLgoKSSdt
IGFmcmFpZCB0aGF0IEkgc3RydWdnbGVkIHRvIHVuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbnQgaGVy
ZS7CoCBBRkFDSVQsCnlvdSBtZWFuIHRoYXQgdGhlIGJhY2twb3J0IG92ZXIgdGhlIGludHJvZHVj
dGlvbiBvZgpwdl9kb21haW5faW5pdGlhbGlzZSgpIG5lZ2xlY3RlZCB0byBhY2NvdW50IGZvciB0
aGUgZmFjdCB0aGF0IHRoZSBpZGxlCmRvbWFpbiBhbHNvIHdhbmRlcnMgdGhpcyBwYXRoIGluIDQu
OSBhbmQgZWFybGllcj8KCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CgpFaXRoZXIgd2F5LCBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
