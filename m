From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] xen/timers: Fix memory leak with cpu
 unplug/plug
Date: Mon, 08 Apr 2019 03:56:00 -0600
Message-ID: <5CAB1AB0020000780022543A@prv1-mh.provo.novell.com>
References: <1554716396-3764-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1554716396-3764-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjA0LjE5IGF0IDExOjM5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gdGltZXJfc29mdGlycV9hY3Rpb24oKSByZWFsbG9jJ3MgaXRzZWxmIGEgbGFyZ2VyIHRp
bWVyIGhlYXAgd2hlbmV2ZXIKPiBuZWNlc3NhcnksIHdoaWNoIGluY2x1ZGVzIGJvb3RzdHJhcHBp
bmcgZnJvbSB0aGUgZW1wdHkgZHVtbXlfaGVhcC4gIE5vdGhpbmcKPiBldmVyIGZyZWVkIHRoaXMg
YWxsb2NhdGlvbi4KPiAKPiBDUFUgcGx1ZyBhbmQgdW5wbHVnIGhhcyB0aGUgc2lkZSBlZmZlY3Qg
b2YgemVyb2luZyB0aGUgcGVyY3B1IGRhdGEgYXJlYSwgd2hpY2gKPiBjbGVhcnMgdHMtPmhlYXAu
ICBUaGlzIGluIHR1cm4gY2F1c2VzIG5ldyB0aW1lcnMgdG8gYmUgcHV0IG9uIHRoZSBsaXN0IHJh
dGhlcgo+IHRoYW4gdGhlIGhlYXAsIGFuZCBmb3IgdGltZXJfc29mdGlycV9hY3Rpb24oKSB0byBi
b290c3RyYXAgaXRzZWxmIGFnYWluLgo+IAo+IFRoaXMgaW4gcHJhY3RpY2UgbGVha3MgdHMtPmhl
YXAgZXZlcnkgdGltZSBhIENQVSBpcyB1bnBsdWdnZWQgYW5kIHJlcGx1Z2dlZC4KPiAKPiBJbXBs
ZW1lbnQgZnJlZV9wZXJjcHVfdGltZXJzKCkgd2hpY2ggaW5jbHVkZXMgZnJlZWluZyB0cy0+aGVh
cCB3aGVuCj4gYXBwcm9wcmlhdGUsIGFuZCB1cGRhdGUgdGhlIG5vdGlmaWVyIGNhbGxiYWNrIHdp
dGggdGhlIHJlY2VudCBjcHUgcGFya2luZwo+IGxvZ2ljIGFuZCBmcmVlLWF2b2lkYW5jZSBhY3Jv
c3Mgc3VzcGVuZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
