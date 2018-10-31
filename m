From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v3 7/7] amd/pvh: enable ACPI C1E disable
 quirk on PVH Dom0
Date: Wed, 31 Oct 2018 13:44:43 -0400
Message-ID: <bb2950da-4047-031a-66ab-b51d11ebc996@oracle.com>
References: <20181030154123.4218-1-roger.pau@citrix.com>
 <20181030154123.4218-8-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3tct=nl=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1gHuY8-0001gr-BX
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 17:45:00 +0000
In-Reply-To: <20181030154123.4218-8-roger.pau@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMzAvMTggMTE6NDEgQU0sIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBQViBEb20wIGhh
cyBhIHF1aXJrIGZvciBzb21lIEFNRCBwcm9jZXNzb3JzLCB3aGVyZSBlbmFibGluZyBBQ1BJIGNh
bgo+IGFsc28gZW5hYmxlIEMxRSBtb2RlLiBBcHBseSB0aGUgc2FtZSB3b3JrYXJvdW5kIGFzIGRv
bmUgb24gUFYgZm9yIGEKPiBQVkggRG9tMCwgd2hpY2ggY29uc2lzdCBvbiB0cmFwcGluZyBhY2Nl
c3NlcyB0byB0aGUgU01JIGNvbW1hbmQgSU8KPiBwb3J0IGFuZCBkaXNhYmxpbmcgQzFFIGlmIEFD
UEkgaXMgZW5hYmxlZC4KPgo+IFJlcG9ydGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Cj4gLS0tCj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBDYzog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBDYzogV2VpIExpdSA8
d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zz
a3lAb3JhY2xlLmNvbT4KPiBDYzogU3VyYXZlZSBTdXRoaWt1bHBhbml0IDxzdXJhdmVlLnN1dGhp
a3VscGFuaXRAYW1kLmNvbT4KPiBDYzogQnJpYW4gV29vZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+
CgoKUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
