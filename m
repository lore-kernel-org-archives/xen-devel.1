From: Andrii Anisov <Andrii_Anisov@epam.com>
Subject: Re: [PATCH 1/4] xen/arm: gic: Ensure we have an ISB
 between ack and do_IRQ()
Date: Tue, 30 Oct 2018 08:07:20 +0000
Message-ID: <2f4fec46-632f-f03a-f165-6bf213f77d91@epam.com>
References: <20181023181709.11883-1-julien.grall@arm.com>
 <20181023181709.11883-2-julien.grall@arm.com>
 <6098937f-98de-bff9-6c48-5575a45875e0@epam.com>
 <57ee191b-be21-701e-ef19-4ed4df1cf289@arm.com>
 <77f72cc9-6548-afd9-3766-23326b3551d9@epam.com>
 <6acf65ef-4302-c403-32ba-1d88ab954265@epam.com>
 <22f7ebc8-c74b-0d8e-4847-9d3df9bcf5db@arm.com>
 <3622e468-8f44-1e31-138f-db58ca3835ff@epam.com>
 <2090f5b4-22ff-38bc-3d47-6dbb6d7fccfb@epam.com>
 <6d1c980b-b316-f634-7793-0aca4b34aa85@arm.com>
 <dd88b504-1120-267e-f157-1ba08afcf438@epam.com>
 <7fb8e43d-d9fa-b3e7-d0a2-11d22a793819@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <7fb8e43d-d9fa-b3e7-d0a2-11d22a793819@arm.com>
Content-Language: en-US
Content-ID: <4D57ED5AA1487F4D8B95DBC9F4FB3A83@EPAM.onmicrosoft.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "andre.przywara@arm.com" <andre.przywara@arm.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgoKT24gMjkuMTAuMTggMTg6MjIsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBXaGF0IGlzIHRo
ZSBpc3N1ZT8gSXMgaXQganVzdCB5b3VyIHByaW50IG9yIHRoZXJlIGEgbGF0ZW50IGJ1ZyBpbiAK
PiBjdXJyZW50IHZHSUM/CgpBaCwgT0ssIHRoYXQgd2FzIHRoZSBpc3N1ZSBmb3IgbWUuCgoKPiBJ
IGFjdHVhbGx5IHByZWZlciBpZiB3ZSByZS1lbmFibGUgaW50ZXJydXB0cyBhZnRlciAKPiBlbnRy
eV9oeXBlcnZpc29yX2hlYWQoKS4gVGhpcyBtYWtlcyB0aGUgY29kZSB3b3JraW5nIHRoZSBzYW1l
IHdheSAKPiBldmVyeXdoZXJlIHNvIGxlc3MgdHJvdWJsZSB0byBmaWd1cmUgb3V0IHByb2JsZW0u
CgpHb29kIHBvaW50LgoKQWN0dWFsbHkgSSB3YXMgY29uZnVzZWQgYnkgdGhlIHJlcG9ydGVkIGJl
aGF2aW9yLCBiZWNhdXNlIEkgb3Zlcmxvb2tlZCAKdGhvc2UgbXNyJ3Mgd2l0aCBkaWZmZXJlbnQg
YXJndW1lbnRzIGluIGVudHJ5LlMgYW5kIGFzc3VtZWQgCmVudGVyX2h5cGVydmlzb3JfaGVhZCgp
IGFsd2F5cyBydW5zIHdpdGggaXJxcyBkaXNhYmxlZC4KCgotLSAKCipBbmRyaWkgQW5pc292KgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
