From: Wanpeng Li <kernellwp@gmail.com>
Subject: Re: [PATCH v2] xen/spinlock: Don't use pvqspinlock if
 only 1 vCPU
Date: Mon, 23 Jul 2018 11:31:13 +0800
Message-ID: <CANRm+CyHfvBKVKNk+pKF+s6+1seZ8c+NyjHuepT2Mf+4Cdd-2w__23696.7610464946$1532316625$gmane$org@mail.gmail.com>
References: <1532036397-19449-1-git-send-email-longman@redhat.com>
 <20180719215456.5ho3udhfoqlkh75a@linux-r8p5>
 <00e98205-606a-a121-36c2-dedaeae1d0bb@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=33wr=kh=gmail.com=kernellwp@srs-us1.protection.inumbo.net>)
 id 1fhRZD-0004hp-PW
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 03:31:23 +0000
Received: by mail-oi0-x244.google.com with SMTP id k12-v6so30769176oiw.8
 for <xen-devel@lists.xenproject.org>; Sun, 22 Jul 2018 20:31:21 -0700 (PDT)
In-Reply-To: <00e98205-606a-a121-36c2-dedaeae1d0bb@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Waiman Long <longman@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Radim Krcmar <rkrcmar@redhat.com>
Cc: Juergen Gross <jgross@suse.com>, Davidlohr Bueso <dave@stgolabs.net>, the arch/x86 maintainers <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyMCBKdWwgMjAxOCBhdCAwNjowMywgV2FpbWFuIExvbmcgPGxvbmdtYW5AcmVkaGF0
LmNvbT4gd3JvdGU6Cj4KPiBPbiAwNy8xOS8yMDE4IDA1OjU0IFBNLCBEYXZpZGxvaHIgQnVlc28g
d3JvdGU6Cj4gPiBPbiBUaHUsIDE5IEp1bCAyMDE4LCBXYWltYW4gTG9uZyB3cm90ZToKPiA+Cj4g
Pj4gT24gYSBWTSB3aXRoIG9ubHkgMSB2Q1BVLCB0aGUgbG9ja2luZyBmYXN0IHBhdGhzIHdpbGwg
YWx3YXlzIGJlCj4gPj4gc3VjY2Vzc2Z1bC4gSW4gdGhpcyBjYXNlLCB0aGVyZSBpcyBubyBuZWVk
IHRvIHVzZSB0aGUgdGhlIFBWIHFzcGlubG9jawo+ID4+IGNvZGUgd2hpY2ggaGFzIGhpZ2hlciBv
dmVyaGVhZCBvbiB0aGUgdW5sb2NrIHNpZGUgdGhhbiB0aGUgbmF0aXZlCj4gPj4gcXNwaW5sb2Nr
IGNvZGUuCj4gPj4KPiA+PiBUaGUgeGVuX3B2c3BpbiB2ZXJpYWJsZSBpcyBhbHNvIHR1cm5lZCBv
ZmYgaW4gdGhpcyAxIHZDUFUgY2FzZSB0bwo+ID4+IGVsaW1pbmF0ZSB1bm5lZWRlZCBwdnFzcGlu
bG9jayBpbml0aWFsaXphdGlvbiBpbiB4ZW5faW5pdF9sb2NrX2NwdSgpCj4gPj4gd2hpY2ggaXMg
cnVuIGFmdGVyIHhlbl9pbml0X3NwaW5sb2NrcygpLgo+ID4KPiA+IFdvdWxkbid0IGt2bSBhbHNv
IHdhbnQgdGhpcz8KPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYva2VybmVsL2t2bS5jIGIv
YXJjaC94ODYva2VybmVsL2t2bS5jCj4gPiBpbmRleCBhMzdiZGEzOGQyMDUuLjk1YWNlYjY5MjAx
MCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gveDg2L2tlcm5lbC9rdm0uYwo+ID4gKysrIGIvYXJjaC94
ODYva2VybmVsL2t2bS5jCj4gPiBAQCAtNDU3LDcgKzQ1Nyw4IEBAIHN0YXRpYyB2b2lkIF9faW5p
dCBzZXZfbWFwX3BlcmNwdV9kYXRhKHZvaWQpCj4gPiBzdGF0aWMgdm9pZCBfX2luaXQga3ZtX3Nt
cF9wcmVwYXJlX2NwdXModW5zaWduZWQgaW50IG1heF9jcHVzKQo+ID4gewo+ID4gICAgIG5hdGl2
ZV9zbXBfcHJlcGFyZV9jcHVzKG1heF9jcHVzKTsKPiA+IC0gICAgaWYgKGt2bV9wYXJhX2hhc19o
aW50KEtWTV9ISU5UU19SRUFMVElNRSkpCj4gPiArICAgIGlmIChudW1fcG9zc2libGVfY3B1cygp
ID09IDEgfHwKPiA+ICsgICAgICAgIGt2bV9wYXJhX2hhc19oaW50KEtWTV9ISU5UU19SRUFMVElN
RSkpCj4gPiAgICAgICAgIHN0YXRpY19icmFuY2hfZGlzYWJsZSgmdmlydF9zcGluX2xvY2tfa2V5
KTsKPiA+IH0KPgo+IFRoYXQgZG9lc24ndCByZWFsbHkgbWF0dGVyIGFzIHRoZSBzbG93cGF0aCB3
aWxsIG5ldmVyIGdldCBleGVjdXRlZCBpbgo+IHRoZSAxIHZDUFUgY2FzZS4KClNvIHRoaXMgaXMg
bm90IG5lZWRlZCBpbiBrdm0gdHJlZT8KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL3Zp
cnQva3ZtL2t2bS5naXQvY29tbWl0Lz9oPXF1ZXVlJmlkPTNhNzkyMTk5MDA0ZWMzMzUzNDZjYzYw
N2Q2MjYwMGEzOTlhN2VlMDIKClJlZ2FyZHMsCldhbnBlbmcgTGkKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
