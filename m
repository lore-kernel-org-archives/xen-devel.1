From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/xen: Remove use of VLAs
Date: Tue, 17 Apr 2018 19:40:13 -0400
Message-ID: <aa447403-766c-8311-5c95-a352b39e019a__12669.1503487111$1524008253$gmane$org@oracle.com>
References: <20180413221146.28476-1-labbott@redhat.com>
 <7cf66c00-74c2-62bb-81f5-4332313a5a6e@oracle.com>
 <e63f261b-9ef3-5750-20df-555291a8a0d8@suse.com>
 <9fe26cf5-01dc-1fb0-25fd-29bf8615047f@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=beq8=hg=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1f8aBT-0000QS-If
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 23:38:47 +0000
In-Reply-To: <9fe26cf5-01dc-1fb0-25fd-29bf8615047f@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Laura Abbott <labbott@redhat.com>, Juergen Gross <jgross@suse.com>
Cc: kernel-hardening@lists.openwall.com, x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMTcvMjAxOCAwNzozMyBQTSwgTGF1cmEgQWJib3R0IHdyb3RlOgo+IE9uIDA0LzE3LzIw
MTggMTI6MTYgQU0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDE2LzA0LzE4IDE1OjI3LCBC
b3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4+PiBPbiAwNC8xMy8yMDE4IDA2OjExIFBNLCBMYXVyYSBB
YmJvdHQgd3JvdGU6Cj4+Pj4gVGhlcmUncyBhbiBvbmdvaW5nIGVmZm9ydCB0byByZW1vdmUgVkxB
c1sxXSBmcm9tIHRoZSBrZXJuZWwgdG8KPj4+PiBldmVudHVhbGx5Cj4+Pj4gdHVybiBvbiAtV3Zs
YS4gVGhlIGZldyBWTEFzIGluIHVzZSBoYXZlIGFuIHVwcGVyIGJvdW5kIGJhc2VkIG9uIGEgc2l6
ZQo+Pj4+IG9mIDY0Sy4gVGhpcyBkb2Vzbid0IHByb2R1Y2UgYW4gZXhjZXNzaXZlbHkgbGFyZ2Ug
c3RhY2sgc28ganVzdCBzd2l0Y2gKPj4+PiB0aGUgdXBwZXIgYm91bmQuCj4+Pj4KPj4+PiBbMV0g
aHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTgvMy83LzYyMQo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1i
eTogTGF1cmEgQWJib3R0IDxsYWJib3R0QHJlZGhhdC5jb20+Cj4+Pj4gLS0tCj4+Pj4gwqAgYXJj
aC94ODYveGVuL2VubGlnaHRlbl9wdi5jIHwgNiArKy0tLS0KPj4+PiDCoCAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBh
L2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYu
Ywo+Pj4+IGluZGV4IGMzNmQyM2FhNmMzNS4uZDk2YTVhNTM1Y2JiIDEwMDY0NAo+Pj4+IC0tLSBh
L2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwo+Pj4+ICsrKyBiL2FyY2gveDg2L3hlbi9lbmxp
Z2h0ZW5fcHYuYwo+Pj4+IEBAIC00MjEsOCArNDIxLDcgQEAgc3RhdGljIHZvaWQgeGVuX2xvYWRf
Z2R0KGNvbnN0IHN0cnVjdCBkZXNjX3B0cgo+Pj4+ICpkdHIpCj4+Pj4gwqAgewo+Pj4+IMKgwqDC
oMKgwqAgdW5zaWduZWQgbG9uZyB2YSA9IGR0ci0+YWRkcmVzczsKPj4+PiDCoMKgwqDCoMKgIHVu
c2lnbmVkIGludCBzaXplID0gZHRyLT5zaXplICsgMTsKPj4+PiAtwqDCoMKgIHVuc2lnbmVkIHBh
Z2VzID0gRElWX1JPVU5EX1VQKHNpemUsIFBBR0VfU0laRSk7Cj4+Pgo+Pj4KPj4+Cj4+PiBJc24n
dCBkdHItPnNpemUgYWx3YXlzIGVpdGhlciBHRFRfU0laRSBvciAwPwo+Pgo+PiBHRFRfU0laRSAt
IDEgOi0pCj4+Cj4+Pj4gLcKgwqDCoCB1bnNpZ25lZCBsb25nIGZyYW1lc1twYWdlc107Cj4+Pj4g
K8KgwqDCoCB1bnNpZ25lZCBsb25nIGZyYW1lc1tESVZfUk9VTkRfVVAoU1pfNjRLLCBQQUdFX1NJ
WkUpXTsKPj4KPj4gU28gd2UgY291bGQganVzdCBnbyB3aXRoIG9uZSBmcmFtZSBhbmQgbW9kaWZ5
IHRoZSBCVUdfT04oKSBmdXJ0aGVyIGJlbG93Cj4+IGFjY29yZGluZ2x5Lgo+Pgo+Cj4gRG8geW91
IHdhbnQgdG8ganVzdCByZW1vdmUgdGhlIGxvb3AgYXMgd2VsbCBzaW5jZSB3ZSdyZSBuZXZlciBn
b2luZwo+IHRvIGRvIG1vcmUgdGhhbiBvbmUgZnJhbWU/IFdlIGVuZCB1cCB3aXRoIG5ldCBjb2Rl
IGRlbGV0aW9uLgo+CgoKWWVzLCB0aGUgbG9vcCwgYXMgd2VsbCBhcyB0aGUgY29tbWVudCBhYm91
dCBtYXggc2l6ZSBiZWluZyA2NEsgY2FuIGFsbApiZSByZW1vdmVkLgoKLWJvcmlzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
