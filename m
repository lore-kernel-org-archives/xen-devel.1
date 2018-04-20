From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 3/3] xen blkback: add fault injection
 facility
Date: Fri, 20 Apr 2018 13:28:19 +0200
Message-ID: <ef016b7b-6c0e-1684-5714-0a6d5a46504e__47205.1863944673$1524223630$gmane$org@suse.com>
References: <20180420104603.17823.31095.stgit@dev-dsk-staskins-1a-ca5afbf2.eu-west-1.amazon.com>
 <20180420104736.17823.42983.stgit@dev-dsk-staskins-1a-ca5afbf2.eu-west-1.amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=7tp6=hj=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f9UDI-0008Sx-24
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 11:28:24 +0000
In-Reply-To: <20180420104736.17823.42983.stgit@dev-dsk-staskins-1a-ca5afbf2.eu-west-1.amazon.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stanislav Kinsburskii <staskins@amazon.com>
Cc: jakub.kicinski@netronome.com, mcroce@redhat.com, hpa@zytor.com, boris.ostrovsky@oracle.com, daniel@iogearbox.net, x86@kernel.org, mingo@redhat.com, xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, paul.durrant@citrix.com, stefanha@redhat.com, dsa@cumulusnetworks.com, tglx@linutronix.de, ggarcia@abra.uab.cat, axboe@kernel.dk, amir.jer.levy@intel.com, wei.liu2@citrix.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, dwmw@amazon.co.uk, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDQvMTggMTI6NDcsIFN0YW5pc2xhdiBLaW5zYnVyc2tpaSB3cm90ZToKPiBUaGlzIHBh
dGNoIGFkZHMgd3JhcHBlciBoZWxwZXJzIGFyb3VuZCBnZW5lcmljIFhlbiBmYXVsdCBpbmplY3QK
PiBmYWNpbGl0eS4KPiBUaGUgbWFqb3IgcmVhc29uIGlzIHRvIGtlZXAgYWxsIHRoZSBtb2R1bGUg
ZmF1bHQgaW5qZWN0aW9uIGRpcmVjdG9yaWVzCj4gaW4gYSBkZWRpY2F0ZWQgc3ViZGlyZWN0b3J5
IGluc3RlYWQgb2YgWGVuIGZhdWx0IGluamVjdCByb290Lgo+IAo+IElPVywgd2hlbiB1c2luZyB0
aGVzZSBoZWxwZXJzLCBwZXItZGV2aWNlIGFuZCBuYW1lZCBieSBkZXZpY2UgbmFtZQo+IGZhdWx0
IGluamVjdGlvbiBjb250cm9sIGRpcmVjdG9yaWVzIHdpbGwgYXBwZWFyIHVuZGVyIHRoZSBmb2xs
b3dpbmcKPiBkaXJlY3Rvcnk6Cj4gLSAvc3lzL2tlcm5lbC9kZWJ1Zy94ZW4vZmF1bHRfaW5qZWN0
L3hlbi1ibGtiYWNrLwo+IGluc3RlYWQgb2Y6Cj4gLSAvc3lzL2tlcm5lbC9kZWJ1Zy94ZW4vZmF1
bHRfaW5qZWN0Lwo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0YW5pc2xhdiBLaW5zYnVyc2tpaSA8c3Rh
c2tpbnNAYW1hem9uLmNvbT4KPiBDQzogSmVucyBBeGJvZSA8YXhib2VAa2VybmVsLmRrPgo+IEND
OiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj4gQ0M6ICJS
b2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gQ0M6IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmcKPiBDQzogbGludXgtYmxvY2tAdmdlci5rZXJuZWwub3JnCj4gQ0M6
IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENDOiBTdGFuaXNsYXYgS2luc2J1cnNr
aWkgPHN0YXNraW5zQGFtYXpvbi5jb20+Cj4gQ0M6IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6
b24uY28udWs+CgpUaGlzIGlzIGFuIGV4YWN0IGNvcHkgb2YgdGhlIG5ldGJhY2sgcGF0Y2ggYXBh
cnQgZnJvbSB0aGUgbmFtZXMuCgpJIGRvbid0IGxpa2UgYWRkaW5nIG11bHRpcGxlIGNvcGllcyBv
ZiB0aGUgc2FtZSBjb2RpbmcgdG8gdGhlIHRyZWUuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
