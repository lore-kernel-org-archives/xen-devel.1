From: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <royger@freebsd.org>
Subject: Re: [PATCH v3 04/15] argo: init, destroy and soft-reset,
 with enable command line opt
Date: Thu, 10 Jan 2019 13:26:07 +0100
Message-ID: <CAPLaKK5npYqGQzy=P7q8VpuTpz7aLKnS-Mid_sjxPuPYOu2MjQ@mail.gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-5-git-send-email-christopher.w.clark@gmail.com>
 <CAPLaKK6z4eNtJx+X3RdTcO8tKb+PxaeBwA_N3wDmbXc7Qss58A@mail.gmail.com>
 <5C3731E9020000780020C2AD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5H7G=PS=gmail.com=royger@srs-us1.protection.inumbo.net>)
 id 1ghZPf-0000Nb-N0
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 12:26:19 +0000
Received: by mail-ot1-f65.google.com with SMTP id s13so1245272otq.4
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jan 2019 04:26:19 -0800 (PST)
In-Reply-To: <5C3731E9020000780020C2AD@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMTAsIDIwMTkgYXQgMTI6NTIgUE0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPgo+ICA+Pj4gT24gMTAuMDEuMTkgYXQgMTE6MTksIDxyb3lnZXJAZnJl
ZWJzZC5vcmc+IHdyb3RlOgo+ID4gYU9uIE1vbiwgSmFuIDcsIDIwMTkgYXQgODo0NCBBTSBDaHJp
c3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+IHdyb3RlOgo+ID4+
Cj4gPj4gKy8qIFhlbiBjb21tYW5kIGxpbmUgb3B0aW9uIHRvIGVuYWJsZSBhcmdvICovCj4gPj4g
K3N0YXRpYyBib29sIF9fcmVhZF9tb3N0bHkgb3B0X2FyZ29fZW5hYmxlZDsKPiA+PiArYm9vbGVh
bl9wYXJhbSgiYXJnbyIsIG9wdF9hcmdvX2VuYWJsZWQpOwo+ID4KPiA+IEkgd291bGQgZHJvcCB0
aGUgb3B0XyogcHJlZml4LCBuZXcgb3B0aW9ucyBhZGRlZCByZWNlbnRseSBkb24ndAo+ID4gaW5j
bHVkZSB0aGUgcHJlZml4IGFscmVhZHkuCj4KPiBXb3VsZCB5b3UgbWluZCBwb2ludGluZyBvdXQg
ZXhhbXBsZXM/IEVzcGVjaWFsbHkgZm9yIGJvb2xlYW4gb25lcyBJCj4gdGhpbmsgd2UndmUgdHJp
ZWQgdG8gY29uc2lzdGVudGx5IG5hbWUgdGhlbSBvcHRfKi4gQnV0IGluIHRoZSBjYXNlCj4gaGVy
ZSAoaXQgYmVpbmcgc3RhdGljKSBJJ20gbm90IG92ZXJseSBmdXNzZWQuCgpJIHdhcyBtb3N0bHkg
dGhpbmtpbmcgYWJvdXQgdGhlIGRvbTBfcHZoIGJvb2xlYW4gb3B0aW9uIHRoYXQgSSBhZGRlZC4K
SSdtIG5vdCBvdmVybHkgZnV6emVkLCBJIGp1c3QgdGhpbmsgaXQncyBub3QgYWRkaW5nIGFueSB2
YWx1ZSB0byB0aGUKdmFyaWFibGUgbmFtZSwgYnV0IGlmIHlvdSBwcmVmZXIgdG8ga2VlcCB0aGUg
b3B0XyBwcmVmaXggdGhhdCdzIGZpbmUuCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
