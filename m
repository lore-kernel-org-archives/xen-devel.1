From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 3/3] drop "domain_" prefix from struct
 domain's dirty CPU mask
Date: Tue, 23 Jan 2018 09:06:12 -0500
Message-ID: <f4fdb06c-5bcd-b0b1-dfff-5354668c5cb9@oracle.com>
References: <5A67176A02000078001A1734@prv-mh.provo.novell.com>
 <5A67199102000078001A1775@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=qiyk=es=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1edzDm-0007vo-Ms
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 14:06:42 +0000
In-Reply-To: <5A67199102000078001A1775@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMjMvMjAxOCAwNToxNiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSXQgYmVpbmcgYSBm
aWVsZCBvZiBzdHJ1Y3QgZG9tYWluIGlzIHN1ZmZpY2llbnQgdG8gcmVjb2duaXplIGl0cwo+IHB1
cnBvc2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Cj4gUmV2aWV3ZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQt
Ynk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KPiBSZXZpZXdlZC1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAtLS0KPiB2Mjog
V2hpdGUgc3BhY2UgY2hhbmdlcyAoY29uc29saWRhdGUgc3BsaXQgbGluZSBzdGF0ZW1lbnRzIGlu
dG8gc2luZ2xlCj4gICAgIGxpbmUgb25lcykuIFJlLWJhc2UuCgoKUmV2aWV3ZWQtYnk6IEJvcmlz
IE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
