From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 6/6] x86: xen: no need to check return value
 of debugfs_create functions
Date: Wed, 23 Jan 2019 09:53:37 +0100
Message-ID: <7fc8d923-ff84-db12-defb-fe554f1711b7__3154.03802539862$1548233684$gmane$org@suse.com>
References: <20190122143542.8816-1-gregkh@linuxfoundation.org>
 <20190122143542.8816-7-gregkh@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=l+rE=P7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gmEI1-0002dL-Fo
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 08:53:41 +0000
In-Reply-To: <20190122143542.8816-7-gregkh@linuxfoundation.org>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org
Cc: xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDEvMjAxOSAxNTozNSwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOgo+IFdoZW4gY2Fs
bGluZyBkZWJ1Z2ZzIGZ1bmN0aW9ucywgdGhlcmUgaXMgbm8gbmVlZCB0byBldmVyIGNoZWNrIHRo
ZQo+IHJldHVybiB2YWx1ZS4gIFRoZSBmdW5jdGlvbiBjYW4gd29yayBvciBub3QsIGJ1dCB0aGUg
Y29kZSBsb2dpYyBzaG91bGQKPiBuZXZlciBkbyBzb21ldGhpbmcgZGlmZmVyZW50IGJhc2VkIG9u
IHRoaXMuCj4gCj4gQ2M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5j
b20+Cj4gQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBDYzogU3RlZmFubyBT
dGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENjOiBUaG9tYXMgR2xlaXhuZXIg
PHRnbHhAbGludXRyb25peC5kZT4KPiBDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+
Cj4gQ2M6IEJvcmlzbGF2IFBldGtvdiA8YnBAYWxpZW44LmRlPgo+IENjOiAiSC4gUGV0ZXIgQW52
aW4iIDxocGFAenl0b3IuY29tPgo+IENjOiA8eDg2QGtlcm5lbC5vcmc+Cj4gQ2M6IDx4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0
bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
