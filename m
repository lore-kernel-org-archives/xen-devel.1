From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/xen: Delay get_cpu_cap until stack
 canary is established
Date: Sat, 31 Mar 2018 14:10:49 -0400
Message-ID: <ee25829c-e8de-1171-e54e-3b34206acc9e__6172.04999221048$1522520141$gmane$org@oracle.com>
References: <20180319165804.10636-1-jandryuk@gmail.com>
 <c3075b0c-a60b-0809-e34b-223701a53b84@oracle.com>
 <CAKf6xps0HJecKM0gYSK+3BGhKknYp9Ydxr3S0oWBThtXeytegw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lplb=gv=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1f2L3d-0004yj-RO
 for xen-devel@lists.xenproject.org; Sat, 31 Mar 2018 18:16:53 +0000
In-Reply-To: <CAKf6xps0HJecKM0gYSK+3BGhKknYp9Ydxr3S0oWBThtXeytegw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwMy8zMS8yMDE4IDAxOjM4IFBNLCBKYXNvbiBBbmRyeXVrIHdyb3RlOgo+IE9uIFdlZCwg
TWFyIDIxLCAyMDE4LCA1OjEyIFBNIEJvcmlzIE9zdHJvdnNreSAKPiA8Ym9yaXMub3N0cm92c2t5
QG9yYWNsZS5jb20gPG1haWx0bzpib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4+IHdyb3RlOgo+
IAo+ICAgICBPbiAwMy8xOS8yMDE4IDEyOjU4IFBNLCBKYXNvbiBBbmRyeXVrIHdyb3RlOgo+ICAg
ICAgPiBDb21taXQgMmNjNDJiYWMxYzc5ICgieDg2LTY0L1hlbjogZWxpbWluYXRlIFcrWCBtYXBw
aW5ncyIpCj4gICAgIGludHJvZHVjZWQgYQo+ICAgICAgPiBjYWxsIHRvIGdldF9jcHVfY2FwLCB3
aGljaCBpcyBmc3RhY2stcHJvdGVjdGVkLsKgIFRoaXMgaXMgd29ya3Mgb24KPiAgICAgeDg2LTY0
Cj4gICAgICA+IGFzIGNvbW1pdCA0ZjI3NzI5NWU1NGMgKCJ4ODYveGVuOiBpbml0ICVncyB2ZXJ5
IGVhcmx5IHRvIGF2b2lkIHBhZ2UKPiAgICAgID4gZmF1bHRzIHdpdGggc3RhY2sgcHJvdGVjdG9y
IikgZW5zdXJlcyB0aGUgc3RhY2sgcHJvdGVjdG9yIGlzCj4gICAgIGNvbmZpZ3VyZWQsCj4gICAg
ICA+IGJ1dCBpdCBpdCBkaWQgbm90IGNvdmVyIHg4Ni0zMi4KPiAgICAgID4KPiAgICAgID4gRGVs
YXkgY2FsbGluZyBnZXRfY3B1X2NhcCB1bnRpbCBhZnRlciB4ZW5fc2V0dXBfZ2R0IGhhcwo+ICAg
ICBpbml0aWFsaXplZCB0aGUKPiAgICAgID4gc3RhY2sgY2FuYXJ5LsKgIFdpdGhvdXQgdGhpcywg
YSAzMmJpdCBQViBtYWNoaW5lIGNyYXNoZXMgZWFybHkKPiAgICAgID4gaW4gYm9vdC4KPiAgICAg
ID4gKFhFTikgRG9tYWluIDAgKHZjcHUjMCkgY3Jhc2hlZCBvbiBjcHUjMDoKPiAgICAgID4gKFhF
TikgLS0tLVsgWGVuLTQuNi42LXhjwqAgeDg2XzY0wqAgZGVidWc9bsKgIFRhaW50ZWQ6wqAgwqAg
QyBdLS0tLQo+ICAgICAgPiAoWEVOKSBDUFU6wqAgwqAgMAo+ICAgICAgPiAoWEVOKSBSSVA6wqAg
wqAgZTAxOTpbPDAwMDAwMDAwYzEwMzYyZjg+XQo+ICAgICAgPgo+ICAgICAgPiBBbmQgdGhlIFBW
IGtlcm5lbCBJUCBjb3JyZXNwb25kcyB0byBpbml0X3NjYXR0ZXJlZF9jcHVpZF9mZWF0dXJlcwo+
ICAgICAgPsKgIMKgIDB4YzEwMzYyZjggPCsyND46wqAgwqAgbW92wqAgwqAgJWdzOjB4MTQsJWVh
eAo+ICAgICAgPgo+ICAgICAgPiBGaXhlcyAyY2M0MmJhYzFjNzkgKCJ4ODYtNjQvWGVuOiBlbGlt
aW5hdGUgVytYIG1hcHBpbmdzIikKPiAgICAgID4KPiAgICAgID4gU2lnbmVkLW9mZi1ieTogSmFz
b24gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29tCj4gICAgIDxtYWlsdG86amFuZHJ5dWtAZ21h
aWwuY29tPj4KPiAgICAgID4KPiAKPiAKPiAgICAgQXBwbGllZCB0byBmb3ItbGludXMtNC4xNwo+
IAo+IAo+IFRoYW5rcy4gSWYgaXQncyBub3QgdG9vIGxhdGUsIGNhbiB0aGlzIGJlIGNjOiBzdGFi
bGU/IAoKCldlIGNhbiBhbHdheXMgdHJ5IDstKQoKVGhpcyBpcyA0LjE1IGFuZCA0LjE2IG9ubHks
IEkgYmVsaWV2ZS4KCi1ib3JpcwoKCgo+IElmIG5vdCwgSSdsbCAKPiBzdWJtaXQgdGhlIHJlcXVl
c3QgYWZ0ZXIgaXQgaXMgaW4gTGludXMncyB0cmVlLgo+IAo+IC1KYXNvbgo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
