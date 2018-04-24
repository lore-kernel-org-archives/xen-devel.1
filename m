From: Juergen Gross <jgross@suse.com>
Subject: Re: [RFC 0/2] To introduce xenwatch multithreading (xen
 mtwatch)
Date: Tue, 24 Apr 2018 07:22:56 +0200
Message-ID: <db08fec6-5648-4d87-4ace-2f42d1d04479@suse.com>
References: <1523100355-27647-1-git-send-email-dongli.zhang@oracle.com>
 <20180423140911.bihiwfwtlneobgzd@citrix.com>
 <6c379249-886d-76ee-db9c-942967b23d80@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=/e5q=hn=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fAqPu-0002GN-Lc
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 05:23:02 +0000
In-Reply-To: <6c379249-886d-76ee-db9c-942967b23d80@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dongli Zhang <dongli.zhang@oracle.com>, Wei Liu <wei.liu2@citrix.com>
Cc: ian.jackson@eu.citrix.com, linux-kernel@vger.kernel.org, srinivas.eeda@oracle.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, Joao Martins <joao.m.martins@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDQvMTggMDE6NTUsIERvbmdsaSBaaGFuZyB3cm90ZToKPiBIaSBXZWksCj4gCj4gT24g
MDQvMjMvMjAxOCAxMDowOSBQTSwgV2VpIExpdSB3cm90ZToKPj4gT24gU2F0LCBBcHIgMDcsIDIw
MTggYXQgMDc6MjU6NTNQTSArMDgwMCwgRG9uZ2xpIFpoYW5nIHdyb3RlOgo+Pj4gQWJvdXQgcGVy
LWRvbVUgeGVud2F0Y2ggdGhyZWFkIGNyZWF0ZS9kZXN0cm95LCBhIG5ldyB0eXBlIG9mIHhlbnN0
b3JlIG5vZGUgaXMKPj4+IGludHJvZHVjZWQ6ICcvbG9jYWwvZG9tYWluLzAvbXR3YXRjaC88ZG9t
aWQ+Jy4KPj4+Cj4+PiBTdXBwb3NlIHRoZSBuZXcgZG9taWQgaWQgNy4gRHVyaW5nIHRoZSBkb21V
IChkb21pZD03KSBjcmVhdGlvbiwgdGhlIHhlbgo+Pj4gdG9vbHN0YWNrIHdyaXRlcyAnL2xvY2Fs
L2RvbWFpbi8wL210d2F0Y2gvNycgdG8geGVuc3RvcmUgYmVmb3JlIHRoZSBpbnNlcnRpb24KPj4+
IG9mICcvbG9jYWwvZG9tYWluLzcnLiBXaGVuIHRoZSBkb21pZD03IGlzIGRlc3Ryb3llZCwgdGhl
IGxhc3QgeGVuc3RvcmUKPj4+IG9wZXJhdGlvbiBieSB4ZW4gdG9vbHN0YWNrIGlzIHRvIHJlbW92
ZSAnL2xvY2FsL2RvbWFpbi8wL210d2F0Y2gvNycuCj4+Pgo+Pj4gVGhlIGRvbTAga2VybmVsIHN1
YnNjcmliZXMgYSB3YXRjaCBhdCBub2RlICcvbG9jYWwvZG9tYWluLzAvbXR3YXRjaCcuICBLZXJu
ZWwKPj4+IHRocmVhZCBbeGVuLW10d2F0Y2gtN10gaXMgY3JlYXRlZCB3aGVuICcvbG9jYWwvZG9t
YWluLzAvbXR3YXRjaC83JyBpcyBpbnNlcnRlZCwKPj4+IHdoaWxlIHRoaXMga2VybmVsIHRocmVh
ZCBpcyBkZXN0cm95ZWQgd2hlbiB0aGUgY29ycmVzcG9uZGluZyB4ZW5zdG9yZSBub2RlIGlzCj4+
PiByZW1vdmVkLgo+Pgo+PiBJbnN0ZWFkIG9mIGludmVudGluZyB5ZXQgYW5vdGhlciBub2RlLCBj
YW4geW91IG5vdCB3YXRjaCAvbG9jYWwvZG9tYWluCj4+IGRpcmVjdGx5Pwo+IAo+IFdvdWxkIHlv
dSBsaWtlIHRvIHdhdGNoIGF0IC9sb2NhbC9kb21haW4gZGlyZWN0bHk/IE9yIGlzIHlvdXIgcXVl
c3Rpb24gImlzIHRoZXJlCj4gYW55IG90aGVyIHdheSB0byBub3Qgd2F0Y2ggYXQgL2xvY2FsL2Rv
bWFpbiwgd2hpbGUgbm8gZXh0cmEgeGVuc3RvcmUgbm9kZSB3aWxsCj4gYmUgaW50cm9kdWNlZCI/
Cj4gCj4gQWN0dWFsbHksIHRoZSBmaXJzdCBwcm90b3R5cGUgb2YgdGhpcyBpZGVhIHdhcyB0byB3
YXRjaCBhdCAvbG9jYWwvZG9tYWluCj4gZGlyZWN0bHkgdG8gZ2V0IGF3YXJlIG9mIHRoZSBkb21V
IGNyZWF0ZS9kZXN0cm95LCBzbyB0aGF0IHhlbiB0b29sc3RhY2sgd2lsbCBub3QKPiBnZXQgaW52
b2x2ZWQuIEpvYW8gTWFydGlucyAoQ0NlZCkgaGFkIGEgY29uY2VybiBvbiB0aGUgcGVyZm9ybWFu
Y2UgYXMgd2F0Y2hpbmcKPiBhdCAvbG9jYWwvZG9tYWluIHdvdWxkIGxlYWQgdG8gbGFyZ2UgYW1v
dW50IG9mIHhlbndhdGNoIGV2ZW50cy4KClRoYXQncyB3aGF0IHRoZSBzcGVjaWFsIHdhdGNoZXMg
IkBpbnRyb2R1Y2VEb21haW4iIGFuZCAiQHJlbGVhc2VEb21haW4iCmFyZSBtZWFudCBmb3IuCgoK
SnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
