From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] xen: make xen_qlock_wait() nestable
Date: Mon, 01 Oct 2018 02:57:44 -0600
Message-ID: <5BB1E18802000078001ED127__8271.50754998929$1538384190$gmane$org@prv1-mh.provo.novell.com>
References: <20181001071641.19282-1-jgross@suse.com>
 <20181001071641.19282-3-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ngkg=mn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g6u1V-00047A-1i
 for xen-devel@lists.xenproject.org; Mon, 01 Oct 2018 08:57:49 +0000
In-Reply-To: <20181001071641.19282-3-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: hpa@zytor.com, Peter Zijlstra <peterz@infradead.org>, the arch/x86 maintainers <x86@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, mingo@redhat.com, Borislav Petkov <bp@alien8.de>, longman@redhat.com, xen-devel <xen-devel@lists.xenproject.org>, tglx@linutronix.de, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjEwLjE4IGF0IDA5OjE2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiB4ZW5f
cWxvY2tfd2FpdCgpIGlzbid0IHNhZmUgZm9yIG5lc3RlZCBjYWxscyBkdWUgdG8gaW50ZXJydXB0
cy4gQSBjYWxsCj4gb2YgeGVuX3Fsb2NrX2tpY2soKSBtaWdodCBiZSBpZ25vcmVkIGluIGNhc2Ug
YSBkZWVwZXIgbmVzdGluZyBsZXZlbAo+IHdhcyBhY3RpdmUgcmlnaHQgYmVmb3JlIHRoZSBjYWxs
IG9mIHhlbl9wb2xsX2lycSgpOgo+IAo+IENQVSAxOiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgQ1BVIDI6Cj4gc3Bpbl9sb2NrKGxvY2sxKQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3Bpbl9sb2NrKGxvY2sxKQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLT4geGVuX3Fsb2NrX3dhaXQoKQo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4geGVuX2NsZWFyX2lycV9wZW5kaW5n
KCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEludGVycnVw
dCBoYXBwZW5zCj4gc3Bpbl91bmxvY2sobG9jazEpCj4gLT4geGVuX3Fsb2NrX2tpY2soQ1BVIDIp
Cj4gc3Bpbl9sb2NrX2lycXNhdmUobG9jazIpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzcGluX2xvY2tfaXJxc2F2ZShsb2NrMikKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC0+IHhlbl9xbG9ja193YWl0KCkKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0+IHhlbl9jbGVhcl9pcnFfcGVuZGlu
ZygpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjbGVh
cnMga2ljayBmb3IgbG9jazEKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC0+IHhlbl9wb2xsX2lycSgpCj4gc3Bpbl91bmxvY2tfaXJxX3Jlc3RvcmUobG9jazIp
Cj4gLT4geGVuX3Fsb2NrX2tpY2soQ1BVIDIpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB3YWtlcyB1cAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3Bpbl91bmxvY2tfaXJxX3Jlc3RvcmUobG9jazIpCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJUkVUCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJlc3VtZXMgaW4geGVuX3Fsb2NrX3dhaXQoKQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPiB4ZW5fcG9sbF9pcnEoKQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBuZXZlciB3YWtlcyB1
cAo+IAo+IFRoZSBzb2x1dGlvbiBpcyB0byBkaXNhYmxlIGludGVycnVwdHMgaW4geGVuX3Fsb2Nr
X3dhaXQoKSBhbmQgbm90IHRvCj4gcG9sbCBmb3IgdGhlIGlycSBpbiBjYXNlIHhlbl9xbG9ja193
YWl0KCkgaXMgY2FsbGVkIGluIG5taSBjb250ZXh0LgoKQXJlIHByZWNhdXRpb25zIGFnYWluc3Qg
Tk1JIHJlYWxseSB3b3J0aHdoaWxlPyBMb2NrcyBhY3F1aXJlZCBib3RoCmluIE5NSSBjb250ZXh0
IGFzIHdlbGwgYXMgb3V0c2lkZSBvZiBpdCBhcmUgbGlhYmxlIHRvIGRlYWRsb2NrIGFueXdheSwK
YXJlbid0IHRoZXk/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
