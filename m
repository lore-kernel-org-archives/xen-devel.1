From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for 4.8 and earlier] x86: re-enable
 XPTI/PCID as needed in switch_native()
Date: Tue, 29 May 2018 17:09:01 +0100
Message-ID: <1cf3dfd2-c79c-a854-3eda-db031a7b32f3@citrix.com>
References: <5B0D797C02000078001C6B3B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yook=iq=citrix.com=prvs=6800201de=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fNhCA-00040t-1q
 for xen-devel@lists.xenproject.org; Tue, 29 May 2018 16:09:58 +0000
In-Reply-To: <5B0D797C02000078001C6B3B@prv1-mh.provo.novell.com>
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

T24gMjkvMDUvMTggMTc6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEFkZGl0aW9uYWxseSBhdm9p
ZCBhY2Nlc3NpbmcgZC0+YXJjaC5wdl9kb21haW4gZm9yIFBWSCBkb21haW5zIChydW5uaW5nCj4g
aW4gYSBIVk0gY29udGFpbmVyKS4KPgo+IFJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgoKSSB3YXMgb25seSBhbiBpbnRlcm1lZGlhcnkuwqAgUmVw
b3J0ZWQtYnk6IFNlcmdleSBEeWFzbGkKPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KCj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
