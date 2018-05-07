From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 3/5] doc: correct livepatch.markdown
 syntax
Date: Mon, 7 May 2018 12:45:05 +0200
Message-ID: <c25e60b1-8ea3-524c-9301-e22eabb12b8a@suse.com>
References: <20180507101608.797-1-jgross@suse.com>
 <20180507101608.797-4-jgross@suse.com>
 <9451c973-62e7-38a6-b264-450a854f2624@citrix.com>
 <49bcd73a-ffdf-8c34-3c48-d7a97f8fdc24@suse.com>
 <95c02851-298c-279e-e4de-2bee909e659c@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=25p9=h2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fFddk-0007sy-MW
 for xen-devel@lists.xenproject.org; Mon, 07 May 2018 10:45:08 +0000
In-Reply-To: <95c02851-298c-279e-e4de-2bee909e659c@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, ross.lagerwall@citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDUvMTggMTI6MzcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMDcvMDUvMTggMTE6
MzAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDA3LzA1LzE4IDEyOjIzLCBBbmRyZXcgQ29v
cGVyIHdyb3RlOgo+Pj4gT24gMDcvMDUvMTggMTE6MTYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gIm1ha2UgLUMgZG9jcyBhbGwiIGZhaWxzIGR1ZSB0byBpbmNvcnJlY3QgbWFya2Rvd24gc3lu
dGF4IGluCj4+Pj4gbGl2ZXBhdGNoLm1hcmtkb3duLiBDb3JyZWN0IGl0Lgo+Pj4gV2hpY2ggdmVy
c2lvbiBvZiBtYXJrZG93biwgb29pP8KgIFZlcnNpb24gMS4wLjEgc2VlbXMgZmluZSB3aXRoIHRo
aXMuCj4+Pgo+PiAuLi4KPj4gL3Vzci9iaW4vcGFuZG9jIC0tbnVtYmVyLXNlY3Rpb25zIC0tdG9j
IC0tc3RhbmRhbG9uZQo+PiBtaXNjL2xpdmVwYXRjaC5tYXJrZG93biAtLW91dHB1dCBwZGYvbWlz
Yy9saXZlcGF0Y2gucGRmCj4+ICEgTGFUZVggRXJyb3I6IENvbW1hbmQgXHRleHRxdW90ZXNpbmds
ZSB1bmF2YWlsYWJsZSBpbiBlbmNvZGluZyBUMS4KPj4KPj4gU2VlIHRoZSBMYVRlWCBtYW51YWwg
b3IgTGFUZVggQ29tcGFuaW9uIGZvciBleHBsYW5hdGlvbi4KPj4gVHlwZSAgSCA8cmV0dXJuPiAg
Zm9yIGltbWVkaWF0ZSBoZWxwLgo+PiAgLi4uCj4+Cj4+IGwuMjUxIC4uLm5jdGlvblwgdG9cIGRp
cmVjdGx5XCBqdW1wXCB0b1wgdGhlXCBuZXd9Cj4+Cj4+IHBhbmRvYzogRXJyb3IgcHJvZHVjaW5n
IFBERgo+PiBNYWtlZmlsZToyNTc6IHJlY2lwZSBmb3IgdGFyZ2V0ICdwZGYvbWlzYy9saXZlcGF0
Y2gucGRmJyBmYWlsZWQKPj4gbWFrZTogKioqIFtwZGYvbWlzYy9saXZlcGF0Y2gucGRmXSBFcnJv
ciA0Mwo+Pgo+PiBncm9zc0BEZXNrdG9wOn4veGVuL2RvY3M+IC91c3IvYmluL3BhbmRvYyAtLXZl
cnNpb24KPj4gcGFuZG9jIDEuMTkuMi4xCj4+IENvbXBpbGVkIHdpdGggcGFuZG9jLXR5cGVzIDEu
MTcuMC41LCB0ZXhtYXRoIDAuOS4xLCBza3lsaWdodGluZyAwLjEuMS41Cj4+IERlZmF1bHQgdXNl
ciBkYXRhIGRpcmVjdG9yeTogL2hvbWUvZ3Jvc3MvLnBhbmRvYwo+PiBDb3B5cmlnaHQgKEMpIDIw
MDYtMjAxNiBKb2huIE1hY0ZhcmxhbmUKPj4gV2ViOiAgaHR0cDovL3BhbmRvYy5vcmcKPiAKPiBB
Y2NvcmRpbmcgdG8gaHR0cHM6Ly9naXRodWIuY29tL2pnbS9wYW5kb2MvaXNzdWVzLzI0MzksIHRo
aXMgaXMgYQo+IHBhY2thZ2luZyBpc3N1ZSwgYW5kIG1hbnVhbGx5IGluc3RhbGxpbmcgdGV4bGl2
ZS1sYXRleC1leHRyYSByZXNvbHZlcwo+IHRoZSBwcm9ibGVtLgoKUmlnaHQuIHRleGxpdmUtdXBx
dW90ZSB3YXMgbWlzc2luZy4gVGhlIG90aGVyIG1hcmtkb3duIHN5bnRheCBhZGFwdGlvbnMKYXJl
IHN0aWxsIG5lY2Vzc2FyeSwgdGhvdWdoLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
