From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/CPUID: don't override tool stack
 decision to hide STIBP
Date: Mon, 28 May 2018 15:01:36 +0100
Message-ID: <eb8a6330-c64b-e837-9f66-c4671b604cd1@citrix.com>
References: <5B0BAAD102000078001C6463@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=klp2=ip=citrix.com=prvs=6795a92d0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fNIiS-0005kr-4w
 for xen-devel@lists.xenproject.org; Mon, 28 May 2018 14:01:40 +0000
In-Reply-To: <5B0BAAD102000078001C6463@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDUvMTggMDg6MDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE90aGVyIHRoYW4gaW4gdGhl
IGZlYXR1cmUgc2V0cywgd2hlcmUgd2UgaW5kZWVkIHdhbnQgdG8gb2ZmZXIgdGhlCj4gZmVhdHVy
ZSBldmVuIGlmIG5vdCBlbnVtZXJhdGVkIG9uIGhhcmR3YXJlLCB3ZSBzaG91bGRuJ3QgZGljdGF0
ZSB0aGUKPiBmZWF0dXJlIGJlaW5nIGF2YWlsYWJsZSBpZiB0b29sIHN0YWNrIG9yIGhvc3QgYWRt
aW4gaGF2ZSBkZWNpZGVkIHRvIG5vdAo+IGV4cG9zZSBpdCAoZm9yIHdoYXRldmVyIFtxdWVzdGlv
bmFibGU/XSByZWFzb24pLiBUaGF0IGZlYXR1cmUgc2V0IHNpZGUKPiBvdmVycmlkZSBpcyBzdWZm
aWNpZW50IHRvIGFjaGlldmUgdGhlIGludGVuZGVkIGd1ZXN0IHNpZGUgc2FmZXR5Cj4gcHJvcGVy
dHkgKGluIG9mZmVyaW5nIC0gYnkgZGVmYXVsdCAtIFNUSUJQIGluZGVwZW5kZW50IG9mIGFjdHVh
bAo+IGF2YWlsYWJpbGl0eSBpbiBoYXJkd2FyZSkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
