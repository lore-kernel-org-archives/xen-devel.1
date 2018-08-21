From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 06/34] x86: fix two unused variable errors
 when !CONFIG_HVM
Date: Tue, 21 Aug 2018 09:11:56 +0100
Message-ID: <b582616e-cef5-afb3-92dd-99e4804f8e0e@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <cf5941eac4668c2b0979339614d549026179dbab.1534518694.git-series.wei.liu2@citrix.com>
 <20180821080916.ipdwzgnckoaippf5@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=z42e=le=citrix.com=prvs=7644e2bb1=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fs1r4-0003Fi-4Q
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 08:17:34 +0000
In-Reply-To: <20180821080916.ipdwzgnckoaippf5@mac>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjEvMDgvMjAxOCAwOTowOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIEF1
ZyAxNywgMjAxOCBhdCAwNDoxMjoyNFBNICswMTAwLCBXZWkgTGl1IHdyb3RlOgo+PiBUaGUgb25l
IGluIGNvbnRleHRfc3dpdGNoIGlzIGZpeGVkIGJ5IGFubm90YXRpbmcgd2l0aCBfX21heWJlX3Vu
dXNlZAo+PiBiZWNhdXNlIEkgd2FudCB0byBrZWVwIHByZXZkIGFyb3VuZC4KPj4KPj4gVGhlIG90
aGVyIGlzIGZpeGVkIGJ5IGVsaW1pbmF0aW5nIHYuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKRkFPRCwgdGhpcyBwYXRjaCBpcyB3cm9uZywgYW5kIG5v
dCBuZWNlc3Nhcnkgd2hlbiB0aGUgYnVnIGluIHRoZQpwcmV2aW91cyBwYXRjaCBoYXMgYmVlbiBm
aXhlZC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
