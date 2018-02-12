From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] xen: xenbus_dev_frontend: Fix
 XS_TRANSACTION_END handling
Date: Mon, 12 Feb 2018 10:06:24 +0100
Message-ID: <1fbf69f9-f835-897e-144f-8c6f8b94cd26__16072.8443334394$1518426343$gmane$org@suse.com>
References: <20180207222236.7434-1-simon@invisiblethingslab.com>
 <ea0630bd-5139-5f79-847c-f88f733b5053@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=wvyf=fg=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1elA4I-0004OB-K9
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2018 09:06:34 +0000
In-Reply-To: <ea0630bd-5139-5f79-847c-f88f733b5053@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Simon Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMDIvMTggMDk6NDksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMDcvMDIvMTggMjM6
MjIsIFNpbW9uIEdhaXNlciB3cm90ZToKPj4gQ29tbWl0IGZkOGFhOTA5NWE5NSAoInhlbjogb3B0
aW1pemUgeGVuYnVzIGRyaXZlciBmb3IgbXVsdGlwbGUKPj4gY29uY3VycmVudCB4ZW5zdG9yZSBh
Y2Nlc3NlcyIpIG1hZGUgYSBzdWJ0bGUgY2hhbmdlIHRvIHRoZSBzZW1hbnRpYyBvZgo+PiB4ZW5i
dXNfZGV2X3JlcXVlc3RfYW5kX3JlcGx5KCkgYW5kIHhlbmJ1c190cmFuc2FjdGlvbl9lbmQoKS4K
Pj4KPj4gQmVmb3JlIG9uIGFuIGVycm9yIHJlc3BvbnNlIHRvIFhTX1RSQU5TQUNUSU9OX0VORAo+
PiB4ZW5idXNfZGV2X3JlcXVlc3RfYW5kX3JlcGx5KCkgd291bGQgbm90IGRlY3JlbWVudCB0aGUg
YWN0aXZlCj4+IHRyYW5zYWN0aW9uIGNvdW50ZXIuIEJ1dCB4ZW5idXNfdHJhbnNhY3Rpb25fZW5k
KCkgaGFzIGFsd2F5cyBjb3VudGVkIHRoZQo+PiB0cmFuc2FjdGlvbiBhcyBmaW5pc2hlZCByZWdh
cmRsZXNzIG9mIHRoZSByZXNwb25zZS4KPiAKPiBXaGljaCBpcyBjb3JyZWN0IG5vdy4gWGVuc3Rv
cmUgd2lsbCBmcmVlIGFsbCB0cmFuc2FjdGlvbiByZWxhdGVkCj4gZGF0YSByZWdhcmRsZXNzIG9m
IHRoZSByZXNwb25zZS4gQSBvbmNlIGZhaWxlZCB0cmFuc2FjdGlvbiBjYW4ndAo+IGJlIHJlcGFp
cmVkLCBpdCBoYXMgdG8gYmUgcmVwZWF0ZWQgY29tcGxldGVseS4KPiAKPiBUaGUgcmVhbCBwcm9i
bGVtIGlzIGRlY3JlbWVudGluZyB0aGUgY291bnRlciB3aGVuIFhTX1RSQU5TQUNUSU9OX0VORAo+
IGZvciBhIG5vbi1leGlzdGluZyB0cmFuc2FjdGlvbiBpcyBiZWluZyBzZW50Lgo+IAo+PiBUaGUg
bmV3IGJlaGF2aW9yIGlzIHRoYXQgeGVuYnVzX2Rldl9yZXF1ZXN0X2FuZF9yZXBseSgpIGFuZAo+
PiB4ZW5idXNfdHJhbnNhY3Rpb25fZW5kKCkgd2lsbCBhbHdheXMgY291bnQgdGhlIHRyYW5zYWN0
aW9uIGFzIGZpbmlzaGVkCj4+IHJlZ2FyZGxlc3MgdGhlIHJlc3BvbnNlIGNvZGUgKGhhbmRsZWQg
aW4geHNfcmVxdWVzdF9leGl0KCkpLgo+IAo+IEVOT0VOVCBzaG91bGQgbm90IGRlY3JlbWVudCB0
aGUgdHJhbnNhY3Rpb24gY291bnRlciwgd2hpbGUgYWxsCj4gb3RoZXIgcmVzcG9uc2VzIHRvIFhT
X1RSQU5TQUNUSU9OX0VORCBzaG91bGQgc3RpbGwgZG8gc28uCgpTb3JyeSwgSSBzdGFuZCBjb3Jy
ZWN0ZWQ6IHRoZSBFTk9FTlQgY2FzZSBzaG91bGQgbmV2ZXIgaGFwcGVuLCBhcyB0aGlzCmNhc2Ug
aXMgdGVzdGVkIGluIHhlbmJ1c193cml0ZV90cmFuc2FjdGlvbigpLiBJdCBkb2Vzbid0IGh1cnQg
dG8gdGVzdApmb3IgRU5PRU5ULCB0aG91Z2guCgpXaGF0IHNob3VsZCBiZSBoYW5kbGVkIGlzIEVJ
TlZBTDogdGhpcyB3b3VsZCBoYXBwZW4gaWYgYSB1c2VyIHNwZWNpZmllZAphIHN0cmluZyBkaWZm
ZXJlbnQgZnJvbSAiVCIgYW5kICJGIi4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
