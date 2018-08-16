From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 0/2] xen/xsm: Cleanup in preparation for XSM
 SILO mode
Date: Thu, 16 Aug 2018 07:46:46 -0600
Message-ID: <5B75804602000078001DEF14@prv1-mh.provo.novell.com>
References: <1530011348-4852-1-git-send-email-andrew.cooper3@citrix.com>
 <ea69e94b-ae3e-552e-9dbb-50085bc0f67c@citrix.com>
 <5B75748602000078001DEE81@prv1-mh.provo.novell.com>
 <eb8dd3b0-8a99-bc1a-b947-9232f1215864@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <eb8dd3b0-8a99-bc1a-b947-9232f1215864@citrix.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Xin Li <xin.li@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Xen-devel <xen-devel@lists.xen.org>, Tim Deegan <tim@xen.org>, Ming Lu <ming.lu@citrix.com>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA4LjE4IGF0IDE1OjE4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTYvMDgvMTggMTM6NTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxNi4w
OC4xOCBhdCAxNDo0NiwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gT24g
MjYvMDYvMTggMTI6MDksIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4gRnV0dXJlIGNoYW5nZXMg
d2lsbCBpbnRyb2R1Y2UgYSBuZXcgU0lMTyBtb2RlLCB3aGljaCBpcyBpbnRlbmRlZCB0byBiZSAK
PiB1c2VmdWwKPj4+PiBmb3IgY2xvdWQgYW5kIGVudGVycHJpc2Ugc2V0dXBzIHdoZXJlIGFsbCBk
b21VcyBhcmUgdW5wcml2aWxlZ2VkIGFuZCBoYXZlIG5vCj4+Pj4gYnVpc25lc3MgY29tbXVuaWNh
dGluZyBkaXJlY3RseS4KPj4+Pgo+Pj4+IFRoaXMgd2FzIGRpc2N1c3NlZCBhdCBYZW5TdW1taXQs
IGJ1dCBJJ2xsIGxlYXZlIGZ1cnRoZXIgZGV0YWlscyB0byB0aGUgCj4gc2VyaWVzCj4+Pj4gd2hp
Y2ggaW50cm9kdWNlcyBpdC4gIEhvd2V2ZXIsIHRvIGJlZ2luIHdpdGgsIGNsZWFuIHVwIHRoZSBY
U00gbmFtZXNwYWNpbmcgCj4gdG8KPj4+PiBiZXR0ZXIgc2VwYXJhdGUgWFNNIGFuZCBGTEFTSy4K
Pj4+Pgo+Pj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+Pj4+Cj4+Pj4gQW5kcmV3IENvb3BlciAo
Mik6Cj4+Pj4gICB4ZW4veHNtOiBSZW5hbWUgQ09ORklHX0ZMQVNLXyogdG8gQ09ORklHX1hTTV9G
TEFTS18qCj4+Pj4gICB4ZW4veHNtOiBSZW5hbWUgQ09OSUZJR19YU01fUE9MSUNZIHRvIENPTkZJ
R19YU01fRkxBU0tfUE9MSUNZCj4+PiBQaW5nICJUaGUgUmVzdCIgaW4gbGlldSBvZiBEYW5pZWwu
ICBUaGlzIHNlcmllcyBpcyBibG9ja2luZyB0aGUKPj4+IGZ1bmN0aW9uYWwgWFNNIFNJTE8gd29y
ay4KPj4gSWlyYyBJIGhhZCBnaXZlbiBzb21lIGNvbW1lbnRzLCByZWdhcmRpbmcgdGhlICh0b28g
bG9uZykgbmFtZXMuCj4+IFRoZSBjaGFuZ2VzIGFyZSBtZWNoYW5pY2FsIGVub3VnaCB0aGF0IEkg
ZG9uJ3QgdGhpbmsgdGhlcmUncwo+PiBtdWNoIGVsc2UgdG8gc2F5Lgo+IAo+IEFuZCBJIGp1c3Rp
ZmllZCB3aHkgdGhlIGN1cnJlbnQgbmFtaW5nIGlzIElNTyB3cm9uZyBhbmQgd2h5IGl0IHdhbnRz
IHRvCj4gYmUgc3VpdGFibHkgbmFtZXNwYWNlZC4KCkJ1dCBJIGRpZG4ndCBvYmplY3QgdG8gdGhl
IHJlbmFtZSAoYW5kIG5hbWUgc3BhY2luZykgaW4gZ2VuZXJhbCwKSSd2ZSBtZXJlbHkgc3VnZ2Vz
dGVkIHRoYXQgc2hvcnRlciAoc3RpbGwgcHJvcGVybHkgbmFtZSBzcGFjZWQpCm5hbWVzIHdvdWxk
IGRvIGFzIHdlbGwuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
