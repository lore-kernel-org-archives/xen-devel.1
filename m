From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v3 07/15] argo: implement the register op
Date: Tue, 15 Jan 2019 00:02:07 -0800
Message-ID: <CACMJ4GZeW_SJmUQNND__2z7WEWZiwiQhcCsa5TSOo1BA=-7f4w@mail.gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
 <1546846968-7372-8-git-send-email-christopher.w.clark@gmail.com>
 <6f2f6778-7316-af79-3b1c-82fc0771e17f@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rejp=PX=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gjJfy-0004EA-AI
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 08:02:22 +0000
Received: by mail-lf1-x144.google.com with SMTP id i26so1330294lfc.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jan 2019 00:02:20 -0800 (PST)
In-Reply-To: <6f2f6778-7316-af79-3b1c-82fc0771e17f@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKYW4gMTQsIDIwMTkgYXQgNzozMSBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDA3LzAxLzIwMTkgMDc6NDIsIENocmlzdG9w
aGVyIENsYXJrIHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1s
aW5lLnBhbmRvYyBiL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwo+ID4gaW5kZXgg
YWVhMTNlYi4uNjhkNDQxNSAxMDA2NDQKPiA+IC0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1s
aW5lLnBhbmRvYwo+ID4gKysrIGIvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCj4g
PiBAQCAtMTkzLDYgKzE5MywyMSBAQCBUaGlzIGFsbG93cyBkb21haW5zIGFjY2VzcyB0byB0aGUg
QXJnbyBoeXBlcmNhbGwsIHdoaWNoIHN1cHBvcnRzIHJlZ2lzdHJhdGlvbgo+ID4gIG9mIG1lbW9y
eSByaW5ncyB3aXRoIHRoZSBoeXBlcnZpc29yIHRvIHJlY2VpdmUgbWVzc2FnZXMsIHNlbmRpbmcg
bWVzc2FnZXMgdG8KPiA+ICBvdGhlciBkb21haW5zIGJ5IGh5cGVyY2FsbCBhbmQgcXVlcnlpbmcg
dGhlIHJpbmcgc3RhdHVzIG9mIG90aGVyIGRvbWFpbnMuCj4gPgo+ID4gKyMjIyBhcmdvLW1hYwo+
ID4gKz4gYD0gcGVybWlzc2l2ZSB8IGVuZm9yY2luZ2AKPgo+IEFyZSB0aGVzZSBjb21tYW5kIGxp
bmUgb3B0aW9ucyBhbHJlYWR5IGluIHVzZSBpbiB0aGUgT3BlblhUIGNvbW11bml0eT8KCk5vLCB0
aGVyZSdzIG5vIGNvbmNlcm4gdGhlcmUuCgo+IEkgYXNrLCBiZWNhdXNlIHdlIGFyZSB0cnlpbmcg
dG8gYXZvaWQgZ2FpbmluZyBtdWx0aXBsZSB0b3AgbGV2ZWwgb3B0aW9ucwo+IGZvciByZWxhdGVk
IGZ1bmN0aW9uYXRsaXkuCj4KPiBJTU8sIHRoaXMgZnVuY3Rpb25hbGl0eSBjb3VsZCBiZSBjb3Zl
cmVkIG1vcmUgc3VjY2luY3RseSB3aXRoOgo+Cj4gICBhcmdvID0gTGlzdCBvZiBbIDxib29sPiwg
bWFjID0gcGVybWlzc2l2ZSB8IGVuZm9yY2luZyBdCj4KPiB3aGljaCBhbHNvIGFsbG93cyBmb3Ig
Y2xlYW5lciBhZGRpdGlvbiBvZiBmdXR1cmUgb3B0aW9ucy4KPgo+IChVbmZvcnR1bmF0ZWx5LCB0
byBpbXBsZW1lbnQgdGhpcywgeW91IG5lZWQgbXkgY21kbGluZV9zdHJjbXAoKSBmaXhlcywKPiB3
aGljaCBhcmUgc3RpbGwgcGVuZGluZyBhbiBhY2suKQoKQXQgUm9nZXIncyByZWNvbW1lbmRhdGlv
biwgdGhlICJhcmdvLW1hYyIgc3RyaW5nIG9wdGlvbiBoYXMgYmVjb21lIHRoZQptdWNoIHNpbXBs
ZXIgImFyZ28tbWFjLXBlcm1pc3NpdmUiIGJvb2xlYW4uCgpGb3IgNC4xMywgSSdkIGxpa2UgdG8g
aW1wcm92ZSB0aGUgaXNvbGF0aW9uIG9mIHdpbGRjYXJkIHJpbmdzIHRvIHRoZQpwb2ludCB3aGVy
ZSB0aGV5J3JlIGFibGUgdG8gYmUgZW5hYmxlZCB3aGVuZXZlciBhcmdvIGl0c2VsZiBpcywgYW5k
CmhvcGVmdWxseSB0aGF0IHdpbGwgZW5hYmxlIHJldGlyaW5nIHRoaXMgb3B0aW9uIGFsdG9nZXRo
ZXIuIElmIHR3bwpib29scyBhcmUgdG9sZXJhYmxlIGZvciBub3cgKGFzIHRoaXMgaXMgc3RpbGwg
ZWFybHkgYW5kIGFuCmV4cGVyaW1lbnRhbCBmZWF0dXJlKSwgd291bGQgaXQgYmUgT0sgdG8gc29y
dCB0aGlzIG91dCBmb3IgNC4xMz8KCkNocmlzdG9waGVyCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
