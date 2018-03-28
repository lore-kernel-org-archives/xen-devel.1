From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 2/7] x86/xpti: don't flush TLB twice when
 switching to 64-bit pv context
Date: Wed, 28 Mar 2018 07:48:12 -0600
Message-ID: <5ABBB93C02000078001B6D20@prv1-mh.provo.novell.com>
References: <20180327090704.28646-1-jgross@suse.com>
 <20180327090704.28646-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=nfe5=gs=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f1BR2-0007BN-6J
 for xen-devel@lists.xenproject.org; Wed, 28 Mar 2018 13:48:16 +0000
In-Reply-To: <20180327090704.28646-3-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjAzLjE4IGF0IDExOjA2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBXaGVu
IHN3aXRjaGluZyB0byBhIDY0LWJpdCBwdiBjb250ZXh0IHRoZSBUTEIgaXMgZmx1c2hlZCB0d2lj
ZSB0b2RheToKPiB0aGUgZmlyc3QgdGltZSB3aGVuIHN3aXRjaGluZyB0byB0aGUgbmV3IGFkZHJl
c3Mgc3BhY2UgaW4KPiB3cml0ZV9wdGJhc2UoKSwgdGhlIHNlY29uZCB0aW1lIHdoZW4gc3dpdGNo
aW5nIHRvIGd1ZXN0IG1vZGUgaW4KPiByZXN0b3JlX3RvX2d1ZXN0Lgo+IAo+IEF2b2lkIHRoZSBm
aXJzdCBUTEIgZmx1c2ggaW4gdGhhdCBjYXNlLgoKVGhpcyBpc24ndCBlbnRpcmVseSBjb3JyZWN0
IC0gd2hhdCB5b3UgYXZvaWQgaXMganVzdCB0aGUgZmx1c2hpbmcgb2YKZ2xvYmFsIGVudHJpZXMu
IFBlcmhhcHMgIkxpbWl0IHRoZSBmaXJzdCBmbHVzaCB0byBub24tZ2xvYmFsIGVudHJpZXMiPwoK
PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
