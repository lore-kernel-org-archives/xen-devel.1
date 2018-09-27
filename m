From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/1] x86/boot: Allocate one extra module
 slot for Xen image placement
Date: Thu, 27 Sep 2018 11:19:24 +0100
Message-ID: <c500fb3e-5b05-7d90-20ad-c1fdeccad6a7@citrix.com>
References: <1538042707-31855-1-git-send-email-daniel.kiper@oracle.com>
 <a06c4a79-beec-ec91-f940-d91693ca9121@citrix.com>
 <20180927101020.GA4558@olila.i.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xlny=mj=citrix.com=prvs=8017a36a5=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g5TOL-0000Sb-4p
 for xen-devel@lists.xenproject.org; Thu, 27 Sep 2018 10:19:29 +0000
In-Reply-To: <20180927101020.GA4558@olila.i.net-space.pl>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDkvMTggMTE6MTAsIERhbmllbCBLaXBlciB3cm90ZToKPiBPbiBUaHUsIFNlcCAyNywg
MjAxOCBhdCAxMTowNjoyNEFNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAyNy8w
OS8xOCAxMTowNSwgRGFuaWVsIEtpcGVyIHdyb3RlOgo+Pj4gQ29tbWl0IDk1ODk5MjcgKHg4Ni9t
YjI6IGF2b2lkIFhlbiBpbWFnZSB3aGVuIGxvb2tpbmcgZm9yCj4+PiBtb2R1bGUvY3Jhc2hrZXJu
ZWwgcG9zaXRpb24pIGZpeGVkIHJlbG9jYXRpb24gaXNzdWVzIGZvcgo+Pj4gTXVsdGlib290MiBw
cm90b2NvbC4gVW5mb3J0dW5hdGVseSBpdCBtaXNzZWQgdG8gYWxsb2NhdGUKPj4+IG1vZHVsZSBz
bG90IGZvciBYZW4gaW1hZ2UgcGxhY2VtZW50IGluIGVhcmx5IGJvb3QgcGF0aC4KPj4+IFNvLCBs
ZXQncyBmaXggaXQgcmlnaHQgbm93Lgo+Pj4KPj4+IFJlcG9ydGVkLWJ5OiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIEtpcGVyIDxkYW5pZWwu
a2lwZXJAb3JhY2xlLmNvbT4KPj4gQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Cj4gV293ISEhIFRoZSBxdWlja2VzdCByZXZpZXcgd2hpY2ggSSBoYXZl
IGdvdCBldmVyISBMZXNzIHRoYW4gMiBtaW5zLi4uIDotKSkpCgpPYnZpb3VzIHBhdGNoIGlzIG9i
dmlvdXMuwqAgTm8gcG9pbnQgbGV0dGluZyBpdCBsYW5ndWlzaC4KCn5BbmRyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
