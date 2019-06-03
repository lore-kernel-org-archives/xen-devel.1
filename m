From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v5 10/10] tools/arm: optee: create optee
 firmware node in DT if tee=optee
Date: Mon, 3 Jun 2019 15:50:19 +0100
Message-ID: <23797.13227.269108.213334@mariner.uk.xensource.com>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-11-volodymyr_babchuk@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oBRP=UC=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hXoIb-0002Ih-Vs
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 14:50:58 +0000
In-Reply-To: <20190521212530.12706-11-volodymyr_babchuk@epam.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Vm9sb2R5bXlyIEJhYmNodWsgd3JpdGVzICgiW1hlbi1kZXZlbF0gW1BBVENIIHY1IDEwLzEwXSB0
b29scy9hcm06IG9wdGVlOiBjcmVhdGUgb3B0ZWUgZmlybXdhcmUgbm9kZSBpbiBEVCBpZiB0ZWU9
b3B0ZWUiKToKPiBJZiBURUUgc3VwcG9ydCBpcyBlbmFibGVkIHdpdGggInRlZT1vcHRlZSIgb3B0
aW9uIGluIHhsLmNmZywKPiB0aGVuIHdlIG5lZWQgdG8gaW5mb3JtIGd1ZXN0IGFib3V0IGF2YWls
YWJsZSBURUUsIGJ5IGNyZWF0aW5nCj4gY29ycmVzcG9uZGluZyBub2RlIGluIHRoZSBndWVzdCdz
IGRldmljZSB0cmVlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xv
ZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KPiBSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUu
Y2l0cml4LmNvbT4KCihyZWx5aW5nIG9uIEp1bGllbidzIHJldmlldyBmb3IgdGhlIGFjdHVhbCBE
VCBkZXRhaWxzKS4KCgpMb29raW5nIGF0IHRoaXMsIGl0IGlzIG5vdCBjbGVhciB0byBtZSB3aHkg
dGhlIGZkdCBwYXJhbWV0ZXIgdG8gYWxsCnRoZXNlIGZ1bmN0aW9ucyBpcyBhIHZvaWQqLiAgV2h5
IGRvZXMgbGliZmR0IG5vdCBpbnRyb2R1Y2UgYQpzdHJ1Y3Qgb3Igc29tZXRoaW5nID8gIChUaGlz
IGlzIGJ5IG5vIG1lYW5zIGEgYmxvY2tlciBmb3IgdGhpcyBwYXRjaC4pCgpUaGFua3MsCklhbi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
