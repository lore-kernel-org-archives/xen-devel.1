From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 05/16] xen: defer call to xen_restrict until
 just before os_setup_post
Date: Mon, 23 Apr 2018 16:58:17 +0100
Message-ID: <20180423155816.GF1980@perard>
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524156319-11465-6-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=l+ue=hm=citrix.com=prvs=644fc49e2=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fAdrM-00053n-O6
 for xen-devel@lists.xenproject.org; Mon, 23 Apr 2018 15:58:32 +0000
Content-Disposition: inline
In-Reply-To: <1524156319-11465-6-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgMTksIDIwMTggYXQgMDU6NDU6MDhQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gZGlmZiAtLWdpdCBhL3N0dWJzL3hlbi1odm0uYyBiL3N0dWJzL3hlbi1odm0uYwo+IGlu
ZGV4IDAwNjdiY2MuLjc3ODdlYTIgMTAwNjQ0Cj4gLS0tIGEvc3R1YnMveGVuLWh2bS5jCj4gKysr
IGIvc3R1YnMveGVuLWh2bS5jCj4gQEAgLTEzLDYgKzEzLDcgQEAKPiAgI2luY2x1ZGUgImh3L3hl
bi94ZW4uaCIKPiAgI2luY2x1ZGUgImV4ZWMvbWVtb3J5LmgiCj4gICNpbmNsdWRlICJxYXBpL3Fh
cGktY29tbWFuZHMtbWlzYy5oIgo+ICsjaW5jbHVkZSAic3lzZW11L3N5c2VtdS5oIgoKSSB0aGlu
ayB0aGlzIGluY2x1ZGUgaXMgbm90IG5lZWRlZCBhbnltb3JlLCBhbmQgY2FuIGdvIGF3YXkgZnJv
bSB0aGUKcGF0Y2ggc2VyaWVzLgoKPiAgCj4gIGludCB4ZW5fcGNpX3Nsb3RfZ2V0X3BpcnEoUENJ
RGV2aWNlICpwY2lfZGV2LCBpbnQgaXJxX251bSkKPiAgewoKLS0gCkFudGhvbnkgUEVSQVJECgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
