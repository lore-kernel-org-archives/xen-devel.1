From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/libxl: Fix build following c/s
 74fd984ae
Date: Fri, 6 Apr 2018 10:02:02 +0200
Message-ID: <9f2517f6-4c09-e873-bd43-865ef3b8e6d9@suse.com>
References: <1522954466-29358-1-git-send-email-andrew.cooper3@citrix.com>
 <20180406080021.g42vr7bb2lnysm57@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180406080021.g42vr7bb2lnysm57@citrix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDQvMTggMTA6MDAsIFdlaSBMaXUgd3JvdGU6Cj4gT24gVGh1LCBBcHIgMDUsIDIwMTgg
YXQgMDc6NTQ6MjZQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gYy9zIDc0ZmQ5ODRh
ZSAidG9vbHMvbGlieGw6IERyb3AgeGNfZG9tYWluX2NvbmZpZ3VyYXRpb25fdCBmcm9tCj4+IGxp
YnhsX19kb21haW5fYnVpbGRfc3RhdGUiIHJlbW92ZWQgc3RhdGUtPmNvbmZpZyBjb21wbGV0ZWx5
LCBidXQgdGhlIEdJQwo+PiB2ZXJzaW9uIGlzIGF2YWlsYWJsZSBpbiBpbmZvLiAgVXNlIHRoZSB1
cC10by1kYXRlIHZlcnNpb24uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+IC0tLQo+PiBDQzogSWFuIEphY2tzb24gPElhbi5K
YWNrc29uQGV1LmNpdHJpeC5jb20+Cj4+IENDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
Pgo+PiBDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+PiBD
QzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4gQ0M6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KPj4KPj4gQ29tcGxldGVseSB1bnRlc3RlZC4gIEkgZG9uJ3Qg
ZXZlbiBoYXZlIGEgY29tcGlsZSBlbnZpcm9ubWVudCB0byBoYW5kLCB3aGljaAo+PiBpcyBob3cg
dGhpcyBnb3QgbWlzc2VkIGJlZm9yZS4gIFNvcnJ5Lgo+IAo+IExvb2tzIGNvcnJlY3QgdG8gbWU6
Cj4gCj4gQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpSZWxlYXNlLWFj
a2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
