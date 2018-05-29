From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] x86/CPUID: don't override tool stack
 decision to hide STIBP
Date: Tue, 29 May 2018 12:15:04 +0200
Message-ID: <b3fafad3-6221-0bd0-04fa-31efcc78d6b9@suse.com>
References: <5B0BAAD102000078001C6463@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ztdp=iq=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fNbel-0003aC-KI
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 10:15:07 +0000
In-Reply-To: <5B0BAAD102000078001C6463@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDUvMTggMDk6MDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE90aGVyIHRoYW4gaW4gdGhl
IGZlYXR1cmUgc2V0cywgd2hlcmUgd2UgaW5kZWVkIHdhbnQgdG8gb2ZmZXIgdGhlCj4gZmVhdHVy
ZSBldmVuIGlmIG5vdCBlbnVtZXJhdGVkIG9uIGhhcmR3YXJlLCB3ZSBzaG91bGRuJ3QgZGljdGF0
ZSB0aGUKPiBmZWF0dXJlIGJlaW5nIGF2YWlsYWJsZSBpZiB0b29sIHN0YWNrIG9yIGhvc3QgYWRt
aW4gaGF2ZSBkZWNpZGVkIHRvIG5vdAo+IGV4cG9zZSBpdCAoZm9yIHdoYXRldmVyIFtxdWVzdGlv
bmFibGU/XSByZWFzb24pLiBUaGF0IGZlYXR1cmUgc2V0IHNpZGUKPiBvdmVycmlkZSBpcyBzdWZm
aWNpZW50IHRvIGFjaGlldmUgdGhlIGludGVuZGVkIGd1ZXN0IHNpZGUgc2FmZXR5Cj4gcHJvcGVy
dHkgKGluIG9mZmVyaW5nIC0gYnkgZGVmYXVsdCAtIFNUSUJQIGluZGVwZW5kZW50IG9mIGFjdHVh
bAo+IGF2YWlsYWJpbGl0eSBpbiBoYXJkd2FyZSkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
