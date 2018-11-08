From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v2 01/11] tools/libs/toollog: Provide a
 default logger
Date: Thu, 8 Nov 2018 17:28:29 +0000
Message-ID: <23524.29245.4775.691541@mariner.uk.xensource.com>
References: <20181108170805.12774-1-ian.jackson@eu.citrix.com>
 <20181108170805.12774-2-ian.jackson@eu.citrix.com>
 <aba7e30d-63cb-fd76-1544-2cbdcb931233@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=t5pf=nt=citrix.com=prvs=843e771e9=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gKo6b-0003rI-Fp
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 17:28:33 +0000
In-Reply-To: <aba7e30d-63cb-fd76-1544-2cbdcb931233@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIIHYyIDAxLzExXSB0
b29scy9saWJzL3Rvb2xsb2c6IFByb3ZpZGUgYSBkZWZhdWx0IGxvZ2dlciIpOgo+IFlvdSB3YW50
IHNvbWV0aGluZyBsaWtlOgo+IAo+IHN0YXRpYyB4ZW50b29sbG9nX2xvZ2dlcl9zdGRpb3N0cmVh
bSBzdGRpb19sb2dnZXIgPSB7Cj4gwqDCoMKgIC52dGFibGUgPSB7Cj4gwqDCoMKgwqDCoMKgwqAg
LnZtZXNzYWdlID0gc3RkaW9zdHJlYW1fdm1lc3NhZ2UsCj4gwqDCoMKgwqDCoMKgwqAgLnByb2dy
ZXNzID0gc3RkaW9zdHJlYW1fcHJvZ3Jlc3MsCj4gwqDCoMKgwqDCoMKgwqAgLmRlc3Ryb3nCoCA9
IDAsIC8qIG5vLW9uZSBzaG91bGQgZGVzdHJveSB0aGlzICovCj4gwqDCoMKgIH0sCj4gwqDCoMKg
IC5taW5fbGV2ZWwgPSBYVExfUFJPR1JFU1MsCj4gwqDCoMKgIC8qIGZvciBvdGhlciBmaWVsZHMg
ZXhjZXB0IC5mLCAwIGlzIGdvb2QgKi8KPiB9Owo+IAo+IHN0YXRpYyB2b2lkIF9fYXR0cmlidXRl
X18oKF9fY29uc3RydWN0b3JfXykpIGluaXRfc3RkaW9fbG9nZ2VyKHZvaWQpCj4gewo+IMKgwqDC
oCBzdGRpb19sb2dnZXIuZiA9IHN0ZGVycjsKPiB9CgpCbGltZXkuICBJcyB0aGF0IHBvcnRhYmxl
IGVub3VnaCA/ICBJIGNhbiBzd2l0Y2ggdG8gdGhhdCBpZiB3ZSB0aGluawpzby4gIEl0J3MgY2Vy
dGFpbmx5IG1vcmUgcGxlYXNhbnQuCgo+IFdoaWNoIHdpbGwgY2F1c2UgdGhlIGxpYnJhcnkgbG9h
ZGVyIHRvIERUUlQsIGJ1dCBub3QgcmVxdWlyZSB5b3UgdG8gbGluawo+IGFnYWluc3QgcHRocmVh
ZCAod2hpY2ggaXMgYSBsYXRlbnQgYnVnIGhlcmUsIGFzIHlvdSBkaWRuJ3QgdXBkYXRlIHRoZQo+
IFNIREVQUykuCgpPb3BzLCBhbHRob3VnaCBpbiBwcmFjdGljZSBJIHRoaW5rIHRoaXMgaXMgbm90
IGdvaW5nIHRvIG1ha2UgYW55CmRpZmZlcmVuY2Ugb24gYW55IHN1cHBvcnRlZCBwbGF0Zm9ybS4K
Cklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
