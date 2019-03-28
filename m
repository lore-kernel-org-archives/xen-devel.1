From: Volodymyr Babchuk <vlad.babchuk@gmail.com>
Subject: Re: [PATCH v2 0/6] xen: simplify suspend/resume handling
Date: Thu, 28 Mar 2019 16:57:33 +0200
Message-ID: <CAOcqxo08gqrLc5UNAQFMW5tZLd3-agh+ETYZ4jwVkSarhmSxtQ@mail.gmail.com>
References: <20190328120658.11083-1-jgross@suse.com>
 <CAOcqxo2Jq7GVGPs=tg17_4pHy_W6+SrvGdP5y0AHARUNe7X+fQ@mail.gmail.com>
 <705a456a-15f9-9b24-e0b1-dc373f7d3e99@arm.com>
 <CAOcqxo1KcE_ZE2OJfyPPEvFJk_hZ+DEsKffNzKHbeN4MoH8a8w@mail.gmail.com>
 <6b45be13fc9ae9ee43b07e16148854c114e5545e.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IWXA=R7=gmail.com=vlad.babchuk@srs-us1.protection.inumbo.net>)
 id 1h9WTT-0000zG-0W
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 14:57:47 +0000
Received: by mail-lj1-x243.google.com with SMTP id q66so17953901ljq.7
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2019 07:57:46 -0700 (PDT)
In-Reply-To: <6b45be13fc9ae9ee43b07e16148854c114e5545e.camel@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gRGFyaW8sCgpPbiBUaHUsIDI4IE1hciAyMDE5IGF0IDE2OjU0LCBEYXJpbyBGYWdnaW9s
aSA8ZGZhZ2dpb2xpQHN1c2UuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgMjAxOS0wMy0yOCBhdCAx
NTo1NiArMDIwMCwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gPiBPbiBUaHUsIDI4IE1hciAy
MDE5IGF0IDE1OjMzLCBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+ID4gd3Jv
dGU6Cj4gPiA+Cj4gPiBBcmUgdGhlIGxvZ3MgYmVsb3cgYWN0dWFsbHkgYSBtaXN0YWtlbiBwYXN0
ZT8KPiA+IE5vLCB0aGlzIGlzIHdoYXQgSSdtIHNlZWluZyBpbiBteSBzZXJpYWwgY29uc29sZS4K
PiA+Cj4gRXJyLCBzb3JyeSwgSSdtIGEgYml0IGNvbmZ1c2VkIG5vdy4uLgo+Cj4gU28sIGlmIHlv
dSB1c2UgdGhlIEFSTSBzdXNwZW5kL3Jlc3VtZSBwYXRjaGVzICsgSnVlcmdlbiBzZXJpZXMgKwo+
IEp1ZXJnZW4gZml4dXAgcGF0Y2ggaW4gdGhpcyBzdWJ0aHJlYWQsIGRvIHlvdSBzdGlsbCBoYXZl
IGlzc3VlcyBvciBpcwo+IGV2ZXJ5dGhpbmcgYWxscmlnaHQ/Ck5vLCBKdWVyZ2VuJ3MgZml4dXAg
Zml4ZWQgdGhlIGlzc3VlLiBTbywgZXZlcnl0aGluZyBpcyBwZXJmZWN0bHkgZmluZS4KClRoYXQg
d2FzIGRpc2N1c3Npb24gb2YgdW5yZWxhdGVkIGlzc3VlIGluIEFSTSBwbGF0Zm9ybSBjb2RlLiBJ
IHRoaW5rLAp3ZSBuZWVkIHRvIGRyb3Agb2ZmIHg4NiBmb2xrcyBmcm9tIENDLiBTb3JyeSBmb3Ig
dGhlIG5vaXNlLgoKLS0gCldCUiBWb2xvZHlteXIgQmFiY2h1ayBha2EgbG9yYyBbKzM4MDk3NjY0
NjAxM10KbWFpbHRvOiB2bGFkLmJhYmNodWtAZ21haWwuY29tCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
