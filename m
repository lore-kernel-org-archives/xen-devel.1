From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 3/6] osstest: abstract code to create a
 FreeBSD build job
Date: Thu, 5 Jul 2018 16:18:43 +0100
Message-ID: <23358.14035.335750.675179@mariner.uk.xensource.com>
References: <20180705141040.39988-1-roger.pau@citrix.com>
 <20180705141040.39988-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=l63l=jv=citrix.com=prvs=717d132a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fb61v-0005oZ-9Q
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 15:18:47 +0000
In-Reply-To: <20180705141040.39988-4-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltQQVRDSCAzLzZdIG9zc3Rlc3Q6IGFic3RyYWN0IGNv
ZGUgdG8gY3JlYXRlIGEgRnJlZUJTRCBidWlsZCBqb2IiKToKPiBJbnRvIGEgaGVscGVyLgoKSSBn
dWVzcyB0aGlzIGlzIHN1cHBvc2VkIHRvIGJlIE5GQywgYnV0IHlvdSBkb24ndCBzYXkgc28uICBI
YXZlIHlvdQpydW4gc3RhbmRhbG9uZS1nZW5lcmF0ZS1kdW1wLWZsaWdodC1ydW52YXJzIGFuZCBk
aWZmZWQgdGhlIHJlc3VsdApiZWZvcmUgYW5kIGFmdGVyID8KCkluIGdlbmVyYWwgdGhhdCdzIGEg
Z29vZCB0aGluZyB0byBkbyB3aGVuIGVkaXRpbmcgdGhlIGZsaWdodApjb25zdHJ1Y3Rpb24gc3R1
ZmYuCgpJIHJlY29tbWVuZAogIE9TU1RFU1RfQ09ORklHPXN0YW5kYWxvbmUtY29uZmlnLWV4YW1w
bGUgZWF0bXlkYXRhIC4vc3RhbmRhbG9uZS1nZW5lcmF0ZS1kdW1wLWZsaWdodC1ydW52YXJzCgpJ
YW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
