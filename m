From: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <royger@freebsd.org>
Subject: Re: [PATCH V3] x86/vm_event: block interrupt injection
 for sync vm_events
Date: Fri, 11 Jan 2019 12:36:28 +0100
Message-ID: <CAPLaKK5UHQdkihVUozJQe4A_b4x8TvG0gdVQUenQj6fPFrfdbA@mail.gmail.com>
References: <1544788198-28303-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lPHj=PT=gmail.com=royger@srs-us1.protection.inumbo.net>)
 id 1ghv7C-0005Cx-4M
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 11:36:42 +0000
Received: by mail-oi1-f195.google.com with SMTP id j21so11930868oii.8
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jan 2019 03:36:40 -0800 (PST)
In-Reply-To: <1544788198-28303-1-git-send-email-rcojocaru@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, suravee.suthikulpanit@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, jun.nakajima@intel.com, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBEZWMgMTQsIDIwMTggYXQgMTI6NTAgUE0gUmF6dmFuIENvam9jYXJ1CjxyY29qb2Nh
cnVAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToKPgo+IEJsb2NrIGludGVycnVwdHMgKGluIHZteF9p
bnRyX2Fzc2lzdCgpKSBmb3IgdGhlIGR1cmF0aW9uIG9mCj4gcHJvY2Vzc2luZyBhIHN5bmMgdm1f
ZXZlbnQgKHNpbWlsYXJseSB0byB0aGUgc3RyYXRlZ3kKPiBjdXJyZW50bHkgdXNlZCBmb3Igc2lu
Z2xlLXN0ZXBwaW5nKS4gT3RoZXJ3aXNlLCBhdHRlbXB0aW5nCj4gdG8gZW11bGF0ZSBhbiBpbnN0
cnVjdGlvbiB3aGVuIHJlcXVlc3RlZCBieSBhIHZtX2V2ZW50Cj4gcmVwbHkgbWF5IGxlZ2l0aW1h
dGVseSBuZWVkIHRvIGNhbGwgZS5nLgo+IGh2bV9pbmplY3RfcGFnZV9mYXVsdCgpLCB3aGljaCB0
aGVuIG92ZXJ3cml0ZXMgdGhlIGFjdGl2ZQo+IGludGVycnVwdCBpbiB0aGUgVk1DUy4KPgo+IFRo
ZSBzeW5jIHZtX2V2ZW50IGhhbmRsaW5nIHBhdGggb24geDg2L1ZNWCBpcyAocm91Z2hseSk6Cj4g
bW9uaXRvcl90cmFwcygpIC0+IHByb2Nlc3Mgdm1fZXZlbnQgLT4gdm14X2ludHJfYXNzaXN0KCkK
PiAocG9zc2libHkgd3JpdGluZyBWTV9FTlRSWV9JTlRSX0lORk8pIC0+Cj4gaHZtX3ZtX2V2ZW50
X2RvX3Jlc3VtZSgpIC0+IGh2bV9lbXVsYXRlX29uZV92bV9ldmVudCgpCj4gKHBvc3NpYmx5IG92
ZXJ3cml0aW5nIHRoZSBWTV9FTlRSWV9JTlRSX0lORk8gdmFsdWUpLgo+Cj4gVGhpcyBwYXRjaCBt
YXkgYWxzbyBiZSBoZWxwZnVsIGZvciB0aGUgZnV0dXJlIHJlbW92YWwKPiBvZiBtYXlfZGVmZXIg
aW4gaHZtX3NldF9jcnswLDMsNH0gYW5kIGh2bV9zZXRfbXNyKCkuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CgpSZXZpZXdlZC1i
eTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpUaGFua3MuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
