From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: vpci: deferral of register write until p2m changes
 are done
Date: Wed, 28 Nov 2018 06:01:12 -0700
Message-ID: <5BFE91980200007800200BDF@prv1-mh.provo.novell.com>
References: <20181128100949.us5zjhswmxx42635@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fBbp=OH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gRzSw-0001SX-Ll
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 13:01:18 +0000
In-Reply-To: <20181128100949.us5zjhswmxx42635@mac>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjExLjE4IGF0IDExOjA5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEhlbGxvLAo+IAo+IFdoaWxlIGRvaW5nIHRoZSByZWNlbnQgdlBDSSBmaXhlcyBhbmQgYWxzbyB3
b3JraW5nIG9uIFNSLUlPViBzdXBwb3J0Cj4gSSd2ZSBiZWVuIHRoaW5raW5nIGFib3V0IGhvdyB2
UENJIGhhbmRsZXMgd3JpdGVzIHRvIFBDSSByZWdpc3RlcnMgdGhhdAo+IGltcGx5IG1vZGlmaWNh
dGlvbnMgdG8gdGhlIHAybSBmb3IgUFZIIERvbTAuCj4gCj4gV2hlbiBtZW1vcnkgZGVjb2Rpbmcg
b3IgUk9NIEJBUnMgYXJlIGVuYWJsZWQgWGVuIHBlcmZvcm1zIHRoZQo+IGZvbGxvd2luZyBmbG93
Ogo+IAo+IDEuIENyZWF0ZSBhIHJhbmdlc2V0IHdpdGggdGhlIG1lbW9yeSByZWdpb25zIHRoYXQg
bmVlZCB0byBiZQo+IG1hcHBlZC91bm1hcHBlZC4KPiAyLiBCbG9jayB0aGUgdkNQVSBhbmQgcGVy
Zm9ybSB0aGUgcDJtIGNoYW5nZXMgaW4gYSBwcmVlbXB0aXZlIHdheS4KPiAzLiBBZnRlciB0aGUg
cDJtIGNoYW5nZXMgaGF2ZSBiZWVuIGFwcGxpZWQgKG9yIGluIGNhc2Ugb2YgZXJyb3IpIHdyaXRl
Cj4gdG8gdGhlIHJlZ2lzdGVyIGluIG9yZGVyIHRvIGVuYWJsZS9kaXNhYmxlIG1lbW9yeSBkZWNv
ZGluZyBvciB0aGUgUk9NCj4gQkFSIGFuZCBtYXJrIHRoZSBCQVJzIGFzIGVuYWJsZWQuCj4gCj4g
SSdtIHVuc3VyZSBhYm91dCB0aGUgYmVuZWZpdCBvZiBkZWZlcnJpbmcgdGhlIHJlZ2lzdGVyIHdy
aXRlIChzdGVwIDMpCj4gZm9yIGEgUFZIIERvbTAsIHNvIEkgd291bGQgbGlrZSB0byBwZXJmb3Jt
IHRoZSByZWdpc3RlciB3cml0ZSBiZWZvcmUKPiBhcHBseWluZyB0aGUgY2hhbmdlcyB0byB0aGUg
cDJtLgoKQXMgZXhwcmVzc2VkIHdoaWxlIHJldmlld2luZyByZXNwZWN0aXZlIHBhdGNoZXMsIEkn
bSBub3Qgc3VyZSBlaXRoZXIuCkJlaW5nIG5vdCBzdXJlLCBwdXR0aW5nIG91cnNlbHZlcyBvbiB0
aGUgc2FmZSBzaWRlIGJ5IGRpc2FibGluZyBkZWNvZGUKZWFybHkgYW5kIGVuYWJsaW5nIGRlY29k
ZSBsYXRlIHNlZW1zIGJlc3QgdG8gbWUgdGhvdWdoLiBBbnkKZGV2aWF0aW9uIGZyb20gdGhpcyB3
b3VsZCBpbW8gcmVxdWlyZSBhIGNvbmNsdXNpdmUgZGlzY3Vzc2lvbiBvZiB3aHkKaXQgaXMgc2Fm
ZS4gSW4gdGhlIGludGVyZXN0IG9mIGxhdGVyIGVuYWJsaW5nIG9mIHRoZSBjb2RlIGZvciBEb21V
LCBhbnkKc3VjaCBkaXNjdXNzaW9uIHNob3VsZCwgYXMgZmFyIGFzIHBvc3NpYmxlLCBhdm9pZCBh
cmd1bWVudGF0aW9uIGFsb25nCnRoZSBEb20wLW9ubHkgbGluZS4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
