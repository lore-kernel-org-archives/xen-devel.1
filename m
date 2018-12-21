From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v7 13/14] libxl: Change
 libxl__domain_suspend_device_model() to be async
Date: Fri, 21 Dec 2018 16:09:13 +0000
Message-ID: <23581.4137.723342.651506@mariner.uk.xensource.com>
References: <20181123135355.6001-1-anthony.perard@citrix.com>
 <20181123135355.6001-14-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CRbA=O6=citrix.com=prvs=886b937d6=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gaNMU-000422-2E
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 16:09:18 +0000
In-Reply-To: <20181123135355.6001-14-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIHY3IDEzLzE0XSBsaWJ4bDogQ2hhbmdlIGxp
YnhsX19kb21haW5fc3VzcGVuZF9kZXZpY2VfbW9kZWwoKSB0byBiZSBhc3luYyIpOgo+IFRoaXMg
Y3JlYXRlIGFuIGV4dHJhIHN0ZXAgZm9yIHRoZSB0d28gY2FsbCBzaXRlcyBvZiB0aGUgZnVuY3Rp
b24uCj4gCj4gbGlieGxfX2RvbWFpbl9zdXNwZW5kX2RldmljZV9tb2RlbCgpIGluIHRoaXMgcGF0
Y2ggZ2V0cyBhbiBleHRyYSBlcnJvcgo+IHZhcmlhYmxlICh0aGVyZSBpcyByZXQgYW5kIHJjKSwg
YnV0IHJldCBnb2VzIGF3YXkgaW4gdGhlIG5leHQgcGF0Y2guCgpBY2tlZC1ieTogSWFuIEphY2tz
b24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
