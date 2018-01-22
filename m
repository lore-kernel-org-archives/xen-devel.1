From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v2 00/12] xen/x86: use per-vcpu stacks
 for 64 bit pv domains
Date: Mon, 22 Jan 2018 05:50:02 -0700
Message-ID: <5A65EC0A02000078001A1118@prv-mh.provo.novell.com>
References: <20180122123256.1431-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=cwx6=er=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1edbY7-0003RP-RO
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 12:50:07 +0000
In-Reply-To: <20180122123256.1431-1-jgross@suse.com>
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
Cc: wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAxLjE4IGF0IDEzOjMyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBBcyBh
IHByZXBhcmF0aW9uIGZvciBkb2luZyBwYWdlIHRhYmxlIGlzb2xhdGlvbiBpbiB0aGUgWGVuIGh5
cGVydmlzb3IKPiBpbiBvcmRlciB0byBtaXRpZ2F0ZSAiTWVsdGRvd24iIHVzZSBkZWRpY2F0ZWQg
c3RhY2tzLCBHRFQgYW5kIFRTUyBmb3IKPiA2NCBiaXQgUFYgZG9tYWlucyBtYXBwZWQgdG8gdGhl
IHBlci1kb21haW4gdmlydHVhbCBhcmVhLgo+IAo+IFRoZSBwZXItdmNwdSBzdGFja3MgYXJlIHVz
ZWQgZm9yIGVhcmx5IGludGVycnVwdCBoYW5kbGluZyBvbmx5LiBBZnRlcgo+IHNhdmluZyB0aGUg
ZG9tYWluJ3MgcmVnaXN0ZXJzIHN0YWNrcyBhcmUgc3dpdGNoZWQgYmFjayB0byB0aGUgbm9ybWFs
Cj4gcGVyIHBoeXNpY2FsIGNwdSBvbmVzIGluIG9yZGVyIHRvIGJlIGFibGUgdG8gYWRkcmVzcyBv
bi1zdGFjayBkYXRhCj4gZnJvbSBvdGhlciBjcHVzIGUuZy4gd2hpbGUgaGFuZGxpbmcgSVBJcy4K
PiAKPiBBZGRpbmcgJWNyMyBzd2l0Y2hpbmcgYmV0d2VlbiBzYXZpbmcgb2YgdGhlIHJlZ2lzdGVy
cyBhbmQgc3dpdGNoaW5nCj4gdGhlIHN0YWNrcyB3aWxsIGVuYWJsZSB0aGUgcG9zc2liaWxpdHkg
dG8gcnVuIGd1ZXN0IGNvZGUgd2l0aG91dCBhbnkKPiBwZXIgcGh5c2ljYWwgY3B1IG1hcHBpbmcs
IGkuZS4gYXZvaWRpbmcgdGhlIHRocmVhdCBvZiBhIGd1ZXN0IGJlaW5nCj4gYWJsZSB0byBhY2Nl
c3Mgb3RoZXIgZG9tYWlucyBkYXRhLgo+IAo+IFdpdGhvdXQgYW55IGZ1cnRoZXIgbWVhc3VyZXMg
aXQgd2lsbCBzdGlsbCBiZSBwb3NzaWJsZSBmb3IgZS5nLiBhCj4gZ3Vlc3QncyB1c2VyIHByb2dy
YW0gdG8gcmVhZCBzdGFjayBkYXRhIG9mIGFub3RoZXIgdmNwdSBvZiB0aGUgc2FtZQo+IGRvbWFp
biwgYnV0IHRoaXMgY2FuIGJlIGVhc2lseSBhdm9pZGVkIGJ5IGEgbGl0dGxlIFBWLUFCSSBtb2Rp
ZmljYXRpb24KPiBpbnRyb2R1Y2luZyBwZXItY3B1IHVzZXIgYWRkcmVzcyBzcGFjZXMuCj4gCj4g
VGhpcyBzZXJpZXMgaXMgbWVhbnQgYXMgYSByZXBsYWNlbWVudCBmb3IgQW5kcmV3J3MgcGF0Y2gg
c2VyaWVzOgo+ICJ4ODY6IFByZXJlcXVpc2l0ZSB3b3JrIGZvciBhIFhlbiBLQUlTRVIgc29sdXRp
b24iLgoKQ29uc2lkZXJpbmcgaW4gcGFydGljdWxhciB0aGUgdHdvIHJldmVydHMsIHdoYXQgSSdt
IG1pc3NpbmcgaGVyZQppcyBhIGNsZWFyIGRlc2NyaXB0aW9uIG9mIHRoZSBtZWFuaW5nZnVsIGFk
ZGl0aW9uYWwgcHJvdGVjdGlvbiB0aGlzCmFwcHJvYWNoIHByb3ZpZGVzIG92ZXIgdGhlIGJhbmQt
YWlkLiBGb3IgY29udGV4dCBzZWUgYWxzbwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2Fy
Y2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMDEvbXNnMDE3MzUuaHRtbAoKSmFuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
