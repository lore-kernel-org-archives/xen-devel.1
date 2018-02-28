From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen/pirq: fix error path cleanup when
	binding MSIs
Date: Wed, 28 Feb 2018 20:22:01 +0100
Message-ID: <bede6e55-88d3-3f61-f196-c53212abc66a__48593.5012031861$1519845649$gmane$org@suse.com>
References: <20180228091903.99889-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=j4wv=fw=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1er7In-00072f-3K
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 19:22:09 +0000
In-Reply-To: <20180228091903.99889-1-roger.pau@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Amit Shah <aams@amazon.com>, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDIvMTggMTA6MTksIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBDdXJyZW50IGNsZWFu
dXAgaW4gdGhlIGVycm9yIHBhdGggb2YgeGVuX2JpbmRfcGlycV9tc2lfdG9faXJxIGlzCj4gd3Jv
bmcuIEZpcnN0IG9mIGFsbCB0aGVyZSdzIGFuIG9mZi1ieS1vbmUgaW4gdGhlIGNsZWFudXAgbG9v
cCwgd2hpY2gKPiBjYW4gbGVhZCB0byB1bmJpbmRpbmcgd3JvbmcgSVJRcy4KPiAKPiBTZWNvbmRs
eSBJUlFzIG5vdCBib3VuZCB3b24ndCBiZSBmcmVlZCwgdGh1cyBsZWFraW5nIElSUSBudW1iZXJz
Lgo+IAo+IE5vdGUgdGhhdCB0aGVyZSdzIG5vIG5lZWQgdG8gZGlmZmVyZW50aWF0ZSBiZXR3ZWVu
IGJvdW5kIGFuZCB1bmJvdW5kCj4gSVJRcyB3aGVuIGZyZWVpbmcgdGhlbSwgX191bmJpbmRfZnJv
bV9pcnEgd2lsbCBkZWFsIHdpdGggYm90aCBvZiB0aGVtCj4gY29ycmVjdGx5Lgo+IAo+IEZpeGVz
OiA0ODkyYzliNGFkYTlmOSAoInhlbjogYWRkIHN1cHBvcnQgZm9yIE1TSSBtZXNzYWdlIGdyb3Vw
cyIpCj4gUmVwb3J0ZWQtYnk6IEhvb21hbiBNaXJoYWRpIDxtaXJoYWRpaEBhbWF6b24uY29tPgo+
IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoK
Q29tbWl0dGVkIHRvIHhlbi90aXAgZm9yLWxpbnVzLTQuMTZhCgoKSnVlcmdlbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
