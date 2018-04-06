From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH-for-4.11] tools: add quirk for loading PVH
 RSDP into low memory
Date: Fri, 6 Apr 2018 14:34:23 +0100
Message-ID: <20180406133423.kftlyshjrwpgrovi@citrix.com>
References: <20180405120911.11633-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v2h2=g3=citrix.com=prvs=627d9795c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1f4RVc-0005sR-0e
 for xen-devel@lists.xenproject.org; Fri, 06 Apr 2018 13:34:28 +0000
Content-Disposition: inline
In-Reply-To: <20180405120911.11633-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com, wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgMDUsIDIwMTggYXQgMDI6MDk6MTFQTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBDb21taXQgNGE1NzMzNzcxZTZmMzM5MThlYmEwN2I1ODRjY2NjZTU2NGE2N2FjMSAo
ImxpYnhsOiBwdXQgUlNEUCBmb3IKPiBQVkggZ3Vlc3QgbmVhciA0R0IiKSBicm9rZSBQVkggZ3Vl
c3RzIHdpdGggTGludXgga2VybmVscyBiZWZvcmUgNC4xNwo+IGFzIHRob3NlIGtlcm5lbHMgYXJl
IG5vdCB0YWtpbmcgdGhlIFJTRFAgYWRkcmVzcyBmcm9tIHRoZSBQVkgKPiBzdGFydF9pbmZvIHN0
cnVjdHVyZSwgYnV0IGFyZSBzZWFyY2hpbmcgaXQgYXMgb24gbGVnYWN5IHN5c3RlbSBieQo+IHNj
YW5uaW5nIGxvdyBtZW1vcnkuCj4gCj4gQWRkIGEgcXVpcmsgdG8gdGhlIGRvbWFpbiBjb25maWcg
dG8gZW5hYmxlIGxvYWRpbmcgdGhlIFJTRFAgYXQgbG93Cj4gYWRkcmVzc2VzIGFnYWluLgo+IAo+
IFNwZWNpZnlpbmcgInB2aF9xdWlya19yc2RwPTEiIHdpbGwgYWNjb21wbGlzaCB0aGF0Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCkknbSBpZ25v
cmluZyB0aGlzIHBhdGNoIGZvciBub3cgYmVjYXVzZSB0aGUgZGlzY3Vzc2lvbiBzZWVtcyB0byBi
ZSBzdGlsbApvbi1nb2luZy4KCkkgdGhpbmsgdGhpcyBpc3N1ZSBzaG91bGQgYmUgYSBibG9ja2Vy
LiBXZSBkb24ndCBuZWVkIHRvIHJ1c2ggdG8gYQpzb2x1dGlvbi4KCldlaS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
