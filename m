From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v3 1/2] libxl: Implement the handler to
 handle unrecoverable AER errors [and 1 more messages]
Date: Tue, 3 Apr 2018 16:06:17 +0100
Message-ID: <23235.39017.980437.46925@mariner.uk.xensource.com>
References: <20180402162536.3134-1-venu.busireddy@oracle.com>
 <20170807235457.3943-1-venu.busireddy@oracle.com>
 <20170807235457.3943-2-venu.busireddy@oracle.com>
 <20170808143301.5kyqlbomcyr3wa4o@citrix.com>
 <20170808145136.GA15728@vbusired-lt>
 <22979.62230.829267.882579@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <22979.62230.829267.882579@mariner.uk.xensource.com>,
 <20180402162536.3134-1-venu.busireddy@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Venu Busireddy <venu.busireddy@oracle.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wim Ten Have <wim.ten.have@oracle.com>, xen-devel@lists.xen.org, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VmVudSBCdXNpcmVkZHkgd3JpdGVzICgiW1JFU0VORCBQQVRDSCB2NSAwLzJdIENvbnRhaW5pbmcg
QUVSIHVucmVjb3ZlcmFibGUgZXJyb3JzIik6Cj4gVGhpcyBwYXRjaCBzZXQgaXMgcGFydCBvZiBh
IHNldCBvZiBwYXRjaGVzIHRoYXQgdG9nZXRoZXIgYWxsb3cgY29udGFpbm1lbnQKPiBvZiB1bnJl
Y292ZXJhYmxlIEFFUiBlcnJvcnMgZnJvbSBQQ0llIGRldmljZXMgYXNzaWduZWQgdG8gZ3Vlc3Rz
IGluCj4gcGFzc3Rocm91Z2ggbW9kZS4gVGhlIGNvbnRhaW5tZW50IGlzIGFjaGlldmVkIGJ5IGZv
cmNpYmx5IHJlbW92aW5nIHRoZQo+IGVycmluZyBQQ0llIGRldmljZSBmcm9tIHRoZSBndWVzdC4K
CkJ1dCwgaW4gU2VwdGVtYmVyLCBJIHdyb3RlOgoKSWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtQ
QVRDSCB2MyAxLzJdIGxpYnhsOiBJbXBsZW1lbnQgdGhlIGhhbmRsZXIgdG8gaGFuZGxlIHVucmVj
b3ZlcmFibGUgQUVSIGVycm9ycyIpOgo+IEknbSBhZnJhaWQgdGhhdCBJIHN0aWxsIGhhdmUgcmVz
ZXJ2YXRpb25zIGFib3V0IHRoZSBkZXNpZ24gcXVlc3Rpb25zLgo+IEV2aWRlbnRseSBJIGRpZG4n
dCBtYWtlIG15IHF1ZXN0aW9ucyBjbGVhciBlbm91Z2guCj4gCj4gWyA2NCBsaW5lcyBvZiBkZXRh
aWxlZCBkaXNjdXNzaW9uIGVsaWRlZCBdCgpJIGhhdmVuJ3Qgc2VlbiBhIHJlcGx5IHRvIHRoYXQu
CgpBbHNvLCBmcm9tIHRoZSBwYXRjaCB2NToKPiBDaGFuZ2VzIGluIHY1Ogo+ICAgKiB2NCB3b3Jr
ZWQgb25seSBpbiB0aGUgY2FzZSBvZiBndWVzdHMgY3JlYXRlZCB1c2luZyAneGwnIGNvbW1hbmQu
Cj4gICAgIEVuaGFuY2VkIHRoZSBmaXggdG8gd29yayBmb3IgZ3Vlc3RzIGNyZWF0ZWQgdXNpbmcg
bGlidmlydCB0b28uCgpJJ20gY29uZnVzZWQgYnkgdGhlIHJlc3BvbnNlcyBpbiB0aGUgdGhyZWFk
IHdoaWNoIHJlbGF0ZSB0byBsaWJ2aXJ0LgpJU1RNIHRoYXQgYSBsaWJ2aXJ0IHBhdGNoIGlzIGFs
c28gcmVxdWlyZWQuICBEbyB5b3UgbWVhbiB0aGF0IGluIHY1CnRoZXJlIGlzIGFsc28gYSBsaWJ2
aXJ0IHBhdGNoID8KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
