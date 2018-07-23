From: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH v2] xen/spinlock: Don't use pvqspinlock if
 only 1 vCPU
Date: Sun, 22 Jul 2018 21:50:35 -0700
Message-ID: <20180723045035.h6jfsfdmgx55ljot__14505.8494912975$1532321370$gmane$org@linux-r8p5>
References: <1532036397-19449-1-git-send-email-longman@redhat.com>
 <20180719215456.5ho3udhfoqlkh75a@linux-r8p5>
 <00e98205-606a-a121-36c2-dedaeae1d0bb@redhat.com>
 <CANRm+CyHfvBKVKNk+pKF+s6+1seZ8c+NyjHuepT2Mf+4Cdd-2w@mail.gmail.com>
 <20180723044257.m7pjrnp7jjqggqij@linux-r8p5>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=cmqz=kh=stgolabs.net=dave@srs-us1.protection.inumbo.net>)
 id 1fhSo0-0002K8-Nk
 for xen-devel@lists.xenproject.org; Mon, 23 Jul 2018 04:50:44 +0000
Content-Disposition: inline
In-Reply-To: <20180723044257.m7pjrnp7jjqggqij@linux-r8p5>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wanpeng Li <kernellwp@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, the arch/x86 maintainers <x86@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, Radim Krcmar <rkrcmar@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Waiman Long <longman@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCAyMiBKdWwgMjAxOCwgRGF2aWRsb2hyIEJ1ZXNvIHdyb3RlOgoKPk9uIE1vbiwgMjMg
SnVsIDIwMTgsIFdhbnBlbmcgTGkgd3JvdGU6Cj4KPj5PbiBGcmksIDIwIEp1bCAyMDE4IGF0IDA2
OjAzLCBXYWltYW4gTG9uZyA8bG9uZ21hbkByZWRoYXQuY29tPiB3cm90ZToKPj4+Cj4+Pk9uIDA3
LzE5LzIwMTggMDU6NTQgUE0sIERhdmlkbG9ociBCdWVzbyB3cm90ZToKPj4+PiBPbiBUaHUsIDE5
IEp1bCAyMDE4LCBXYWltYW4gTG9uZyB3cm90ZToKPj4+Pgo+Pj4+PiBPbiBhIFZNIHdpdGggb25s
eSAxIHZDUFUsIHRoZSBsb2NraW5nIGZhc3QgcGF0aHMgd2lsbCBhbHdheXMgYmUKPj4+Pj4gc3Vj
Y2Vzc2Z1bC4gSW4gdGhpcyBjYXNlLCB0aGVyZSBpcyBubyBuZWVkIHRvIHVzZSB0aGUgdGhlIFBW
IHFzcGlubG9jawo+Pj4+PiBjb2RlIHdoaWNoIGhhcyBoaWdoZXIgb3ZlcmhlYWQgb24gdGhlIHVu
bG9jayBzaWRlIHRoYW4gdGhlIG5hdGl2ZQo+Pj4+PiBxc3BpbmxvY2sgY29kZS4KPj4+Pj4KPj4+
Pj4gVGhlIHhlbl9wdnNwaW4gdmVyaWFibGUgaXMgYWxzbyB0dXJuZWQgb2ZmIGluIHRoaXMgMSB2
Q1BVIGNhc2UgdG8KPgo+cy92ZXJpYWJsZQo+IHZhcmlhYmxlCj4KPj4+Pj4gZWxpbWluYXRlIHVu
bmVlZGVkIHB2cXNwaW5sb2NrIGluaXRpYWxpemF0aW9uIGluIHhlbl9pbml0X2xvY2tfY3B1KCkK
Pj4+Pj4gd2hpY2ggaXMgcnVuIGFmdGVyIHhlbl9pbml0X3NwaW5sb2NrcygpLgo+Pj4+Cj4+Pj4g
V291bGRuJ3Qga3ZtIGFsc28gd2FudCB0aGlzPwo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gv
eDg2L2tlcm5lbC9rdm0uYyBiL2FyY2gveDg2L2tlcm5lbC9rdm0uYwo+Pj4+IGluZGV4IGEzN2Jk
YTM4ZDIwNS4uOTVhY2ViNjkyMDEwIDEwMDY0NAo+Pj4+IC0tLSBhL2FyY2gveDg2L2tlcm5lbC9r
dm0uYwo+Pj4+ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9rdm0uYwo+Pj4+IEBAIC00NTcsNyArNDU3
LDggQEAgc3RhdGljIHZvaWQgX19pbml0IHNldl9tYXBfcGVyY3B1X2RhdGEodm9pZCkKPj4+PiBz
dGF0aWMgdm9pZCBfX2luaXQga3ZtX3NtcF9wcmVwYXJlX2NwdXModW5zaWduZWQgaW50IG1heF9j
cHVzKQo+Pj4+IHsKPj4+PiAgICAgbmF0aXZlX3NtcF9wcmVwYXJlX2NwdXMobWF4X2NwdXMpOwo+
Pj4+IC0gICAgaWYgKGt2bV9wYXJhX2hhc19oaW50KEtWTV9ISU5UU19SRUFMVElNRSkpCj4+Pj4g
KyAgICBpZiAobnVtX3Bvc3NpYmxlX2NwdXMoKSA9PSAxIHx8Cj4+Pj4gKyAgICAgICAga3ZtX3Bh
cmFfaGFzX2hpbnQoS1ZNX0hJTlRTX1JFQUxUSU1FKSkKPj4+PiAgICAgICAgIHN0YXRpY19icmFu
Y2hfZGlzYWJsZSgmdmlydF9zcGluX2xvY2tfa2V5KTsKPj4+PiB9Cj4+Pgo+Pj5UaGF0IGRvZXNu
J3QgcmVhbGx5IG1hdHRlciBhcyB0aGUgc2xvd3BhdGggd2lsbCBuZXZlciBnZXQgZXhlY3V0ZWQg
aW4KPj4+dGhlIDEgdkNQVSBjYXNlLgo+Cj5Ib3cgZG9lcyB0aGlzIGRpZmZlciB0aGVuIGZyb20g
eGVuLCB0aGVuPyBJIG1lYW4sIHNhbWUgcHJpbmNpcGxlIGFwcGxpZXMuCj4KPj4KPj5TbyB0aGlz
IGlzIG5vdCBuZWVkZWQgaW4ga3ZtIHRyZWU/Cj4+aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL3ZpcnQva3ZtL2t2bS5naXQvY29tbWl0Lz9oPXF1ZXVlJmlkPTNhNzkyMTk5MDA0ZWMzMzUz
NDZjYzYwN2Q2MjYwMGEzOTlhN2VlMDIKPgo+SG1tIEkgd291bGQgdGhpbmsgdGhhdCBteSBwYXRj
aCB3b3VsZCBiZSBtb3JlIGFwcHJvcGlhdGUgYXMgaXQgYWN0dWFsbHkgZG9lcwo+d2hhdCB0aGUg
Y29tbWVudCBzYXlzLgoKQm90aCB3b3VsZCBiZSBuZWVkZWQgYWN0dWFsbHkgeWVzLCBidXQgYWxz
byBkaXNhYmxpbmcgdGhlIHZpcnRfc3Bpbl9sb2NrX2tleQp3b3VsZCBiZSBtb3JlIHJvYnVzdCBp
bW8uCgpUaGFua3MsCkRhdmlkbG9ocgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
