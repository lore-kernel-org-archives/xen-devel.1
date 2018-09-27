From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH 1/1] x86/boot: Allocate one extra module
 slot for Xen image placement
Date: Thu, 27 Sep 2018 12:10:20 +0200
Message-ID: <20180927101020.GA4558@olila.i.net-space.pl>
References: <1538042707-31855-1-git-send-email-daniel.kiper@oracle.com>
 <a06c4a79-beec-ec91-f940-d91693ca9121@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fvyv=mj=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1g5TFn-0007wg-CY
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 10:10:39 +0000
Content-Disposition: inline
In-Reply-To: <a06c4a79-beec-ec91-f940-d91693ca9121@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBTZXAgMjcsIDIwMTggYXQgMTE6MDY6MjRBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNy8wOS8xOCAxMTowNSwgRGFuaWVsIEtpcGVyIHdyb3RlOgo+ID4gQ29tbWl0
IDk1ODk5MjcgKHg4Ni9tYjI6IGF2b2lkIFhlbiBpbWFnZSB3aGVuIGxvb2tpbmcgZm9yCj4gPiBt
b2R1bGUvY3Jhc2hrZXJuZWwgcG9zaXRpb24pIGZpeGVkIHJlbG9jYXRpb24gaXNzdWVzIGZvcgo+
ID4gTXVsdGlib290MiBwcm90b2NvbC4gVW5mb3J0dW5hdGVseSBpdCBtaXNzZWQgdG8gYWxsb2Nh
dGUKPiA+IG1vZHVsZSBzbG90IGZvciBYZW4gaW1hZ2UgcGxhY2VtZW50IGluIGVhcmx5IGJvb3Qg
cGF0aC4KPiA+IFNvLCBsZXQncyBmaXggaXQgcmlnaHQgbm93Lgo+ID4KPiA+IFJlcG9ydGVkLWJ5
OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVs
IEtpcGVyIDxkYW5pZWwua2lwZXJAb3JhY2xlLmNvbT4KPgo+IEFja2VkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKV293ISEhIFRoZSBxdWlja2VzdCByZXZp
ZXcgd2hpY2ggSSBoYXZlIGdvdCBldmVyISBMZXNzIHRoYW4gMiBtaW5zLi4uIDotKSkpCgpUaGFu
a3MsCgpEYW5pZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
