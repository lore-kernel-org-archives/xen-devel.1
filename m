From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Qemu-devel] [PATCH 14/16] os-posix: cleanup:
 Replace fprintf with error_report in remaining call sites
Date: Fri, 20 Apr 2018 11:19:50 +0100
Message-ID: <23257.48838.736085.250541@mariner.uk.xensource.com>
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524156319-11465-15-git-send-email-ian.jackson@eu.citrix.com>
 <f594f663-d53c-690e-8797-48cbbe43f8fa@amsat.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=buxg=hj=citrix.com=prvs=641335876=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f9T92-0002Jo-2o
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 10:19:56 +0000
In-Reply-To: <f594f663-d53c-690e-8797-48cbbe43f8fa@amsat.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>
List-Id: xen-devel@lists.xenproject.org

UGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JpdGVzICgiUmU6IFtRZW11LWRldmVsXSBbUEFUQ0gg
MTQvMTZdIG9zLXBvc2l4OiBjbGVhbnVwOiBSZXBsYWNlIGZwcmludGYgd2l0aCBlcnJvcl9yZXBv
cnQgaW4gcmVtYWluaW5nIGNhbGwgc2l0ZXMiKToKPiBPbiAwNC8xOS8yMDE4IDAxOjQ1IFBNLCBJ
YW4gSmFja3NvbiB3cm90ZToKPiA+IC0gICAgZnByaW50ZihzdGRlcnIsICJDaGFuZ2Ugb2YgcHJv
Y2VzcyBuYW1lIG5vdCBzdXBwb3J0ZWQgYnkgeW91ciBPU1xuIik7Cj4gPiArICAgIGVycm9yX3Jl
cG9ydCgiQ2hhbmdlIG9mIHByb2Nlc3MgbmFtZSBub3Qgc3VwcG9ydGVkIGJ5IHlvdXIgT1NcbiIp
Owo+IAo+IHJlbW92aW5nIHRoZSB0cmFpbGluZyAiXG4iOgo+IFJldmlld2VkLWJ5OiBQaGlsaXBw
ZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdAYW1zYXQub3JnPgoKRGFtbiwgbWlzc2VkIG9uZSEgIFRo
YW5rcyA6LSkuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
