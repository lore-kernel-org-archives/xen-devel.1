From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] VMX: don't ignore P2M setup error
Date: Wed, 6 Feb 2019 11:28:45 +0100
Message-ID: <e1245edc-5a8f-15d8-49f1-56cc902e20f6@suse.com>
References: <5C5AB5DA020000780021436D@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8kDD=QN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1grKRo-0001NY-Q0
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 10:28:52 +0000
In-Reply-To: <5C5AB5DA020000780021436D@suse.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDIvMjAxOSAxMToyNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gc2V0X21taW9fcDJtX2Vu
dHJ5KCkgbWF5IGZhaWwsIGluIHBhcnRpY3VsYXIgd2l0aCAtRU5PTUVNLiBEb24ndCBpZ25vcmUK
PiBzdWNoIGFuIGVycm9yLCBidXQgaW5zdGVhZCBjYXVzZSBkb21haW4gY3JlYXRpb24gdG8gZmFp
bCBpbiBzdWNoIGEgY2FzZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4gLS0tCj4gNC4xMjogQW5vdGhlciBjYW5kaWRhdGUsIGJ1dCBhZ2FpbiBv
cGVuIGZvciBkaXNjdXNzaW9uLgoKSSdtIGZpbmUgd2l0aCB0aGF0IGluIDQuMTI6CgpSZWxlYXNl
LWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
