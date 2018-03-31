From: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH] x86/xen: Delay get_cpu_cap until stack
 canary is established
Date: Sat, 31 Mar 2018 14:29:49 -0400
Message-ID: <CAKf6xpvhX3_MehbYP-XbJPRgVMyFbZ6f6fsJyaTfHca0xwTpWw__48358.4302048714$1522520923$gmane$org@mail.gmail.com>
References: <20180319165804.10636-1-jandryuk@gmail.com>
 <c3075b0c-a60b-0809-e34b-223701a53b84@oracle.com>
 <CAKf6xps0HJecKM0gYSK+3BGhKknYp9Ydxr3S0oWBThtXeytegw@mail.gmail.com>
 <ee25829c-e8de-1171-e54e-3b34206acc9e@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=eied=gv=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1f2LGD-0005rP-F7
 for xen-devel@lists.xenproject.org; Sat, 31 Mar 2018 18:29:53 +0000
Received: by mail-lf0-x244.google.com with SMTP id m200-v6so10315861lfm.4
 for <xen-devel@lists.xenproject.org>; Sat, 31 Mar 2018 11:29:51 -0700 (PDT)
In-Reply-To: <ee25829c-e8de-1171-e54e-3b34206acc9e@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org, open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBNYXIgMzEsIDIwMTggYXQgMjoxMCBQTSwgQm9yaXMgT3N0cm92c2t5Cjxib3Jpcy5v
c3Ryb3Zza3lAb3JhY2xlLmNvbT4gd3JvdGU6Cj4gT24gMDMvMzEvMjAxOCAwMTozOCBQTSwgSmFz
b24gQW5kcnl1ayB3cm90ZToKPj4gT24gV2VkLCBNYXIgMjEsIDIwMTgsIDU6MTIgUE0gQm9yaXMg
T3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbQo+PiA8bWFpbHRvOmJvcmlzLm9z
dHJvdnNreUBvcmFjbGUuY29tPj4gd3JvdGU6Cj4+Cj4+ICAgICBPbiAwMy8xOS8yMDE4IDEyOjU4
IFBNLCBKYXNvbiBBbmRyeXVrIHdyb3RlOgo+PiAgICAgID4gQ29tbWl0IDJjYzQyYmFjMWM3OSAo
Ing4Ni02NC9YZW46IGVsaW1pbmF0ZSBXK1ggbWFwcGluZ3MiKQo+PiAgICAgaW50cm9kdWNlZCBh
Cj4+ICAgICAgPiBjYWxsIHRvIGdldF9jcHVfY2FwLCB3aGljaCBpcyBmc3RhY2stcHJvdGVjdGVk
LiAgVGhpcyBpcyB3b3JrcyBvbgo+PiAgICAgeDg2LTY0Cj4+ICAgICAgPiBhcyBjb21taXQgNGYy
NzcyOTVlNTRjICgieDg2L3hlbjogaW5pdCAlZ3MgdmVyeSBlYXJseSB0byBhdm9pZCBwYWdlCj4+
ICAgICAgPiBmYXVsdHMgd2l0aCBzdGFjayBwcm90ZWN0b3IiKSBlbnN1cmVzIHRoZSBzdGFjayBw
cm90ZWN0b3IgaXMKPj4gICAgIGNvbmZpZ3VyZWQsCj4+ICAgICAgPiBidXQgaXQgaXQgZGlkIG5v
dCBjb3ZlciB4ODYtMzIuCj4+ICAgICAgPgo+PiAgICAgID4gRGVsYXkgY2FsbGluZyBnZXRfY3B1
X2NhcCB1bnRpbCBhZnRlciB4ZW5fc2V0dXBfZ2R0IGhhcwo+PiAgICAgaW5pdGlhbGl6ZWQgdGhl
Cj4+ICAgICAgPiBzdGFjayBjYW5hcnkuICBXaXRob3V0IHRoaXMsIGEgMzJiaXQgUFYgbWFjaGlu
ZSBjcmFzaGVzIGVhcmx5Cj4+ICAgICAgPiBpbiBib290Lgo+PiAgICAgID4gKFhFTikgRG9tYWlu
IDAgKHZjcHUjMCkgY3Jhc2hlZCBvbiBjcHUjMDoKPj4gICAgICA+IChYRU4pIC0tLS1bIFhlbi00
LjYuNi14YyAgeDg2XzY0ICBkZWJ1Zz1uICBUYWludGVkOiAgICBDIF0tLS0tCj4+ICAgICAgPiAo
WEVOKSBDUFU6ICAgIDAKPj4gICAgICA+IChYRU4pIFJJUDogICAgZTAxOTpbPDAwMDAwMDAwYzEw
MzYyZjg+XQo+PiAgICAgID4KPj4gICAgICA+IEFuZCB0aGUgUFYga2VybmVsIElQIGNvcnJlc3Bv
bmRzIHRvIGluaXRfc2NhdHRlcmVkX2NwdWlkX2ZlYXR1cmVzCj4+ICAgICAgPiAgICAweGMxMDM2
MmY4IDwrMjQ+OiAgICBtb3YgICAgJWdzOjB4MTQsJWVheAo+PiAgICAgID4KPj4gICAgICA+IEZp
eGVzIDJjYzQyYmFjMWM3OSAoIng4Ni02NC9YZW46IGVsaW1pbmF0ZSBXK1ggbWFwcGluZ3MiKQo+
PiAgICAgID4KPj4gICAgICA+IFNpZ25lZC1vZmYtYnk6IEphc29uIEFuZHJ5dWsgPGphbmRyeXVr
QGdtYWlsLmNvbQo+PiAgICAgPG1haWx0bzpqYW5kcnl1a0BnbWFpbC5jb20+Pgo+PiAgICAgID4K
Pj4KPj4KPj4gICAgIEFwcGxpZWQgdG8gZm9yLWxpbnVzLTQuMTcKPj4KPj4KPj4gVGhhbmtzLiBJ
ZiBpdCdzIG5vdCB0b28gbGF0ZSwgY2FuIHRoaXMgYmUgY2M6IHN0YWJsZT8KPgo+IFdlIGNhbiBh
bHdheXMgdHJ5IDstKQo+Cj4gVGhpcyBpcyA0LjE1IGFuZCA0LjE2IG9ubHksIEkgYmVsaWV2ZS4K
CkknbSB1c2luZyB0aGlzIHBhdGNoIG9uIDQuMTQsIHNvIHRoZXJlIGFzIHdlbGwuCgotSmFzb24K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
