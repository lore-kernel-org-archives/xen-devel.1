From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/9] x86/IRQ: deal with move cleanup count
 state in fixup_irqs()
Date: Tue, 7 May 2019 10:12:59 +0200
Message-ID: <20190507081259.j5odjv3t23ggjims@Air-de-Roger>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CC6DEA80200007800229E9D@prv1-mh.provo.novell.com>
 <20190503152142.icdzlax4arik3beg@Air-de-Roger>
 <5CD133A4020000780022C58D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LnsF=TH=citrix.com=prvs=0236038e6=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hNvER-00086q-EN
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 08:13:47 +0000
Content-Disposition: inline
In-Reply-To: <5CD133A4020000780022C58D@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXkgMDcsIDIwMTkgYXQgMDE6Mjg6MzZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDAzLjA1LjE5IGF0IDE3OjIxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMDU6MjM6MjBBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gLS0tCj4gPj4gVEJEOiBUaGUgcHJvcGVyIHJlY29yZGluZyBvZiB0
aGUgSVBJIGRlc3RpbmF0aW9ucyBhY3R1YWxseSBtYWtlcyB0aGUKPiA+PiAgICAgIG1vdmVfY2xl
YW51cF9jb3VudCBmaWVsZCByZWR1bmRhbnQuIERvIHdlIHdhbnQgdG8gZHJvcCBpdCwgYXQgdGhl
Cj4gPj4gICAgICBwcmljZSBvZiBhIGZldyBtb3JlIENQVS1tYXNrIG9wZXJhdGlvbnM/Cj4gPiAK
PiA+IEFGQUlDVCB0aGlzIGlzIG5vdCBhIGhvdCBwYXRoLCBzbyBJIHdvdWxkIHJlbW92ZSB0aGUK
PiA+IG1vdmVfY2xlYW51cF9jb3VudCBmaWVsZCBhbmQganVzdCB3ZWlnaHQgdGhlIGNwdSBiaXRt
YXAgd2hlbiBuZWVkZWQuCj4gCj4gRlRSOiBJdCdzIG5vdCBmdWxseSByZWR1bmRhbnQgLSB0aGUg
cGF0Y2ggcmVtb3ZpbmcgaXQgdGhhdCBJIGhhZAo+IGFkZGVkIHdhcyBhY3R1YWxseSB0aGUgcmVh
c29uIGZvciBzZWVpbmcgdGhlIEFTU0VSVCgpIHRyaWdnZXIKPiB0aGF0IHlvdSBkaWQgYXNrIHRv
IGFkZCBpbiBwYXRjaCAxLiBUaGUgcmVhc29uIGlzIHRoYXQgdGhlIGZpZWxkCj4gc2VydmVzIGFz
IGEgZmxhZyBmb3IgaXJxX21vdmVfY2xlYW51cF9pbnRlcnJ1cHQoKSB3aGV0aGVyIHRvCj4gYWN0
IG9uIGFuIElSUSBpbiB0aGUgZmlyc3QgcGxhY2UuIFdpdGhvdXQgaXQsIHRoZSBmdW5jdGlvbiB3
aWxsCj4gcHJlbWF0dXJlbHkgY2xlYW4gdXAgdGhlIHZlY3RvciwgdGh1cyBjb25mdXNpbmcgc3Vi
c2VxdWVudAo+IGNvZGUgdHJ5aW5nIHRvIGRvIHRoZSBjbGVhbnVwIHdoZW4gaXQncyBhY3R1YWxs
eSBkdWUuCgpTbyB3ZWlnaGluZyBkZXNjLT5hcmNoLm9sZF9jcHVfbWFzayBpcyBub3QgZXF1aXZh
bGVudCB0bwptb3ZlX2NsZWFudXBfY291bnQ/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
