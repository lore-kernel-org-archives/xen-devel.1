From: Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [PATCH 22/22] vixen: dom0 builder support
Date: Mon, 8 Jan 2018 10:26:21 -0800
Message-ID: <CA+aC4kt+i5uCPzvaA_XZSFMT0ON7XhkPc6FYy9q0dmZ51TzBFQ@mail.gmail.com>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
 <1515279277-16301-23-git-send-email-aliguori@amzn.com>
 <20180108182259.GA23034@char.us.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=h9h4=ed=codemonkey.ws=anthony@srs-us1.protection.inumbo.net>)
 id 1eYc7t-0005EI-Re
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 18:26:25 +0000
Received: by mail-lf0-x235.google.com with SMTP id j143so13120376lfg.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2018 10:26:24 -0800 (PST)
In-Reply-To: <20180108182259.GA23034@char.us.oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Anthony Liguori <aliguori@amzn.com>, Wei Liu <wei.liu2@citrix.com>, Matt Wilson <msw@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Jan_H=2E_Sch=C3=B6nherr?= <jschoenh@amazon.de>, Anthony Liguori <aliguori@amazon.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gOCwgMjAxOCBhdCAxMDoyMiBBTSwgS29ucmFkIFJ6ZXN6dXRlayBXaWxrCjxr
b25yYWQud2lsa0BvcmFjbGUuY29tPiB3cm90ZToKPiAuc25pcC4uCj4+ICsgICAgcHJpbnRrKCJW
aXhlbiBYZW5zdG9yZSBldnRjaG4gaXMgJWQsIHBmbiBpcyAweCUiIFBSSXg2NCAiXG4iLAo+PiAr
ICAgICAgICAgICAqcHN0b3JlX2V2dGNobiwgKnBzdG9yZV9tZm4pOwo+Cj4gU28uLiBwYXRjaCAi
IGNvbnNvbGU6IGRvIG5vdCBwcmludCBiYW5uZXIgaWYgYmVsb3cgaW5mbyBsb2cgdGhyZXNob2xk
Igo+IHNwZWFrcyBhYm91dCBoYXZpbmcgdGhlIHByaW50ayBiZSBhcyBjbG9zZSB0byB3aGF0IHRo
ZSBQViBndWVzdCB3b3VsZCBiZQo+IGJ1dCBoZXJlIHlvdSBhcmUgcHJvdmlkaW5nIHRoZSBwcmlu
dGtzLgo+ID8KPiBBbmQgdGhlIG90aGVyIHBhdGNoZXMgdG9vPwoKV2hlbiB1c2luZyBsb2dsdmw9
bm9uZSwgdGhpcyBwcmludGsgd2lsbCBiZSBzdXBwcmVzc2VkLiAgSXQncyB1c2VmdWwKZm9yIGRl
YnVnZ2luZyB0aG91Z2guCgpUaGUgYmFubmVyIHBhdGNoIHdhcyBuZWVkZWQgYmVjYXVzZSBldmVu
IHdpdGggbG9nbHZsPW5vbmUsIHRoZSBiYW5uZXIKaXMgc3RpbGwgcHJpbnRlZCBvdXQuCgpUaGUg
UUVNVSBjb25zb2xlIHBhdGNoIGlzIHlldCBhbm90aGVyIG9wdGlvbiB3aGljaCBzZW5kcyB0aGUg
WGVuCmxvZ2dpbmcgb3V0cHV0IHRvIHRoZQpRRU1VIGxvZy4KClJlZ2FyZHMsCgpBbnRob255IExp
Z3VvcmkKCgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
Zwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
