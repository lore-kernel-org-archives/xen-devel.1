From: Andrii Anisov <Andrii_Anisov@epam.com>
Subject: Re: [PATCH v3 1/2] xen/arm: make platform specific code
 dependent on ALL32_PLAT or ALL64_PLAT
Date: Tue, 23 Oct 2018 11:10:30 +0000
Message-ID: <9798acdd-e047-3f05-e112-0b50856eac79@epam.com>
References: <alpine.DEB.2.10.1809241554040.15006@sstabellini-ThinkPad-X260>
 <1537829704-22680-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pzao=nd=epam.com=andrii_anisov@srs-us1.protection.inumbo.net>)
 id 1gEua7-0006oG-Ea
 for xen-devel@lists.xenproject.org; Tue, 23 Oct 2018 11:10:39 +0000
In-Reply-To: <1537829704-22680-1-git-send-email-sstabellini@kernel.org>
Content-Language: en-US
Content-ID: <26258505944E214FA26E2AD606A4CFCB@eurprd03.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <stefanos@xilinx.com>, "julien.grall@arm.com" <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gU3RlZmFubywNCg0KDQpPbiAyNS4wOS4xOCAwMTo1NSwgU3RlZmFubyBTdGFiZWxsaW5p
IHdyb3RlOg0KPiBDb21waWxlIHBsYXRmb3JtIGNvZGUgdGhhdCBkb2Vzbid0IGhhdmUgaXRzIG93
biBzcGVjaWZpYyBrY29uZmlnIG9wdGlvbg0KPiBvbmx5IGlmIEFMTDMyX1BMQVQgb3IgQUxMNjRf
UExBVCBkZXBlbmRpbmcgb24gdGhlIGFyY2hpdGVjdHVyZS4gVGhlDQo+IGJlbmVmaXQgaXMgdGhh
dCBjaG9vc2luZyBvbmUgb2YgdGhlIHBsYXRmb3JtcyBhdmFpbGFibGUgYXMgYSBtZW51DQo+IG9w
dGlvbiBhbGxvd3MgdGhlIHVzZXIgbm90IHRvIGJ1aWxkIG90aGVyIHVubmVjZXNzYXJ5IHBsYXRm
b3JtIGNvZGUuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFu
b3NAeGlsaW54LmNvbT4NClJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292
QGVwYW0uY29tPg0KDQotLSANCg0KKkFuZHJpaSBBbmlzb3YqDQoNCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
