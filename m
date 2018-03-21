From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/xen: Delay get_cpu_cap until stack
 canary is established
Date: Wed, 21 Mar 2018 17:14:21 -0400
Message-ID: <c3075b0c-a60b-0809-e34b-223701a53b84__42069.3892323927$1521666683$gmane$org@oracle.com>
References: <20180319165804.10636-1-jandryuk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fvqy=gl=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1eyl2H-0004xr-JD
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 21:12:41 +0000
In-Reply-To: <20180319165804.10636-1-jandryuk@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jason Andryuk <jandryuk@gmail.com>, Juergen Gross <jgross@suse.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTkvMjAxOCAxMjo1OCBQTSwgSmFzb24gQW5kcnl1ayB3cm90ZToKPiBDb21taXQgMmNj
NDJiYWMxYzc5ICgieDg2LTY0L1hlbjogZWxpbWluYXRlIFcrWCBtYXBwaW5ncyIpIGludHJvZHVj
ZWQgYQo+IGNhbGwgdG8gZ2V0X2NwdV9jYXAsIHdoaWNoIGlzIGZzdGFjay1wcm90ZWN0ZWQuICBU
aGlzIGlzIHdvcmtzIG9uIHg4Ni02NAo+IGFzIGNvbW1pdCA0ZjI3NzI5NWU1NGMgKCJ4ODYveGVu
OiBpbml0ICVncyB2ZXJ5IGVhcmx5IHRvIGF2b2lkIHBhZ2UKPiBmYXVsdHMgd2l0aCBzdGFjayBw
cm90ZWN0b3IiKSBlbnN1cmVzIHRoZSBzdGFjayBwcm90ZWN0b3IgaXMgY29uZmlndXJlZCwKPiBi
dXQgaXQgaXQgZGlkIG5vdCBjb3ZlciB4ODYtMzIuCj4KPiBEZWxheSBjYWxsaW5nIGdldF9jcHVf
Y2FwIHVudGlsIGFmdGVyIHhlbl9zZXR1cF9nZHQgaGFzIGluaXRpYWxpemVkIHRoZQo+IHN0YWNr
IGNhbmFyeS4gIFdpdGhvdXQgdGhpcywgYSAzMmJpdCBQViBtYWNoaW5lIGNyYXNoZXMgZWFybHkK
PiBpbiBib290Lgo+IChYRU4pIERvbWFpbiAwICh2Y3B1IzApIGNyYXNoZWQgb24gY3B1IzA6Cj4g
KFhFTikgLS0tLVsgWGVuLTQuNi42LXhjICB4ODZfNjQgIGRlYnVnPW4gIFRhaW50ZWQ6ICAgIEMg
XS0tLS0KPiAoWEVOKSBDUFU6ICAgIDAKPiAoWEVOKSBSSVA6ICAgIGUwMTk6WzwwMDAwMDAwMGMx
MDM2MmY4Pl0KPgo+IEFuZCB0aGUgUFYga2VybmVsIElQIGNvcnJlc3BvbmRzIHRvIGluaXRfc2Nh
dHRlcmVkX2NwdWlkX2ZlYXR1cmVzCj4gICAgMHhjMTAzNjJmOCA8KzI0PjogICAgbW92ICAgICVn
czoweDE0LCVlYXgKPgo+IEZpeGVzIDJjYzQyYmFjMWM3OSAoIng4Ni02NC9YZW46IGVsaW1pbmF0
ZSBXK1ggbWFwcGluZ3MiKQo+Cj4gU2lnbmVkLW9mZi1ieTogSmFzb24gQW5kcnl1ayA8amFuZHJ5
dWtAZ21haWwuY29tPgo+CgoKQXBwbGllZCB0byBmb3ItbGludXMtNC4xNwoKLWJvcmlzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
